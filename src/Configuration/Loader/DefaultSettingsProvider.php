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

namespace WorldlineOP\PrestaShop\Configuration\Loader;

if (!defined('_PS_VERSION_')) {
    exit;
}

use Symfony\Component\Yaml\Parser;
use WorldlineOP\PrestaShop\OptionsResolver\AccountSettingsResolver;
use WorldlineOP\PrestaShop\OptionsResolver\AdvancedSettingsResolver;
use WorldlineOP\PrestaShop\OptionsResolver\PaymentMethodsSettingsResolver;

/**
 * Class DefaultSettingsProvider
 *
 * Provides the default settings of install/defaults.yml, used at install and for shops without saved settings
 */
class DefaultSettingsProvider
{
    /** @var array|null */
    private $configuration;

    /**
     * DefaultSettingsProvider constructor.
     */
    public function __construct()
    {
        $this->configuration = null;
    }

    /**
     * @return array
     */
    public function getAccountSettings()
    {
        $accountSettings = $this->getConfigurationSection('accountSettings');
        $accountSettings['webhookMode'] = 'automatic';
        $accountSettings['additionalWebhookUrls'] = [];

        $resolver = new AccountSettingsResolver();

        return $resolver->resolve($accountSettings);
    }

    /**
     * @return array
     */
    public function getAdvancedSettings()
    {
        $advancedSettings = $this->getConfigurationSection('advancedSettings');
        $advancedSettings['paymentSettings']['successOrderStateId'] = \Configuration::get('PS_OS_PAYMENT');
        $advancedSettings['paymentSettings']['pendingOrderStateId'] = \Configuration::getGlobalValue('WOP_PENDING_ORDER_STATUS_ID');
        $advancedSettings['paymentSettings']['errorOrderStateId'] = \Configuration::get('PS_OS_ERROR');

        $resolver = new AdvancedSettingsResolver();

        return $resolver->resolve($advancedSettings);
    }

    /**
     * @return array
     */
    public function getPaymentMethodsSettings()
    {
        $resolver = new PaymentMethodsSettingsResolver();

        return $resolver->resolve($this->getConfigurationSection('paymentMethodsSettings'));
    }

    /**
     * @param string $section
     *
     * @return array
     */
    private function getConfigurationSection($section)
    {
        $configuration = $this->getConfiguration();
        if (!isset($configuration[$section]) || !is_array($configuration[$section])) {
            return [];
        }

        return $configuration[$section];
    }

    /**
     * @return array
     */
    private function getConfiguration()
    {
        if (null !== $this->configuration) {
            return $this->configuration;
        }

        $parser = new Parser();
        $defaults = $parser->parse(\Tools::file_get_contents(dirname(__DIR__, 3) . '/install/defaults.yml'));
        $this->configuration = isset($defaults['configuration']) && is_array($defaults['configuration']) ? $defaults['configuration'] : [];

        return $this->configuration;
    }
}
