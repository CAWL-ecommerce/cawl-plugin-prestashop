<?php
/**
 * 2021 CAWL Online Payments
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0).
 * It is also available through the world-wide-web at this URL: https://opensource.org/licenses/AFL-3.0
 *
 * @author    PrestaShop partner
 * @copyright 2021 CAWL Online Payments
 * @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 */

namespace WorldlineOP\PrestaShop\Presenter;

if (!defined('_PS_VERSION_')) {
    exit;
}

use OnlinePayments\Sdk\Domain\WebhooksEvent;
use WorldlineOP\PrestaShop\Configuration\Entity\Settings;
use WorldlineOP\PrestaShop\Logger\LoggerFactory;

/**
 * Class TransactionPresenter
 */
class WebhookEventPresenter implements PresenterInterface
{
    const CVCO_PRODUCT_ID = 5403;
    const MEALVOUCHER_PRODUCT_ID = 5402;
    const ILLICADO_PRODUCT_ID = 3112;
    const EVENTS_PAYMENT_AUTHORIZED = [
        'payment.pending_approval',
        'payment.pending_completion',
        'payment.pending_capture',
    ];
    const EVENTS_PAYMENT_ACCEPTED = ['payment.captured'];
    const EVENTS_PAYMENT_PENDING = ['payment.authorization_requested'];
    const EVENTS_REFUNDED = ['payment.refunded'];
    const EVENTS_PAYMENT_CANCELLED = ['payment.cancelled'];
    const EVENTS_PAYMENT_REJECTED = ['payment.rejected'];

    /** @var GetPaymentPresenter */
    private $paymentPresenter;

    /** @var GetRefundPresenter */
    private $refundPresenter;

    /** @var \Monolog\Logger */
    private $logger;

    /**
     * WebhookEventPresenter constructor.
     *
     * @param GetPaymentPresenter $paymentPresenter
     * @param GetRefundPresenter $refundPresenter
     * @param LoggerFactory $loggerFactory
     */
    public function __construct(
        GetPaymentPresenter $paymentPresenter,
        GetRefundPresenter $refundPresenter,
        LoggerFactory $loggerFactory
    ) {
        $this->paymentPresenter = $paymentPresenter;
        $this->refundPresenter = $refundPresenter;
        $this->logger = $loggerFactory->setChannel('Webhooks');
    }

    /**
     * @param WebhooksEvent $event
     * @param Settings $settings
     */
    public function handlePending($event, $settings)
    {
        $paymentEvents = array_merge(
            self::EVENTS_PAYMENT_AUTHORIZED,
            self::EVENTS_PAYMENT_ACCEPTED,
            self::EVENTS_PAYMENT_REJECTED
        );

        if (in_array($event->getType(), $paymentEvents)) {
            $this->logger->debug(
                sprintf('Putting webhook of type %s to sleep', $event->getType()),
                ['time' => $settings->advancedSettings->paymentSettings->safetyDelay]);
            sleep($settings->advancedSettings->paymentSettings->safetyDelay);
        }
    }

    /**
     * @param WebhooksEvent|bool $event
     * @param int|bool $idShop
     *
     * @return TransactionPresented
     *
     * @throws \PrestaShopException
     * @throws \PrestaShop\Decimal\Exception\DivisionByZeroException
     */
    public function present($event = false, $idShop = false)
    {
        $paymentEvents = array_merge(
            self::EVENTS_PAYMENT_PENDING,
            self::EVENTS_PAYMENT_AUTHORIZED,
            self::EVENTS_PAYMENT_ACCEPTED,
            self::EVENTS_PAYMENT_CANCELLED,
            self::EVENTS_PAYMENT_REJECTED
        );
        if (in_array($event->getType(), self::EVENTS_REFUNDED)) {
            $presentedData = $this->refundPresenter->present($event->getRefund(), $idShop);
        } elseif (in_array($event->getType(), $paymentEvents) && $this->shouldHandleEvent($event)) {
            $presentedData = $this->paymentPresenter->present($event->getPayment(), $idShop);
        } else {
            $presentedData = new TransactionPresented();
        }
        $this->logger->debug('Returning data', ['data' => $presentedData]);

        return $presentedData;
    }

    /**
     * @param WebhooksEvent $event
     * @return bool
     */
    private function shouldHandleEvent($event)
    {
        /** @var \OnlinePayments\Sdk\Domain\PaymentResponse|null $payment */
        $payment = $event->getPayment();
        /** @var \OnlinePayments\Sdk\Domain\PaymentOutput|null $paymentOutput */
        $paymentOutput = $payment ? $payment->getPaymentOutput() : null;
        /** @var \OnlinePayments\Sdk\Domain\RedirectPaymentMethodSpecificOutput|null $redirectMethodSpecificInput */
        $redirectMethodSpecificInput = $paymentOutput ? $paymentOutput->getRedirectPaymentMethodSpecificOutput() : null;
        $paymentProductId = $redirectMethodSpecificInput ? $redirectMethodSpecificInput->getPaymentProductId() : null;
        /** @var \OnlinePayments\Sdk\Domain\AmountOfMoney|null $amountOfMoneyObj */
        $amountOfMoneyObj = $paymentOutput ? $paymentOutput->getAmountOfMoney() : null;
        $amountOfMoney = $amountOfMoneyObj ? $amountOfMoneyObj->getAmount() : null;
        /** @var \OnlinePayments\Sdk\Domain\AmountOfMoney|null $acquiredAmountObj */
        $acquiredAmountObj = $paymentOutput ? $paymentOutput->getAcquiredAmount() : null;
        $acquiredAmount = $acquiredAmountObj ? $acquiredAmountObj->getAmount() : null;

        if ($paymentProductId === self::CVCO_PRODUCT_ID
            || $paymentProductId === self::MEALVOUCHER_PRODUCT_ID
            || $paymentProductId === self::ILLICADO_PRODUCT_ID) {
            return $amountOfMoney && $acquiredAmount && ($amountOfMoney === $acquiredAmount);
        }

        return true;
    }
}
