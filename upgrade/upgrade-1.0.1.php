<?php
/**
 * 2021 Worldline Online Payments
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0).
 * It is also available through the world-wide-web at this URL: https://opensource.org/licenses/AFL-3.0
 *
 * @author    PrestaShop partner
 * @copyright 2021 Worldline Online Payments
 * @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 */

if (!defined('_PS_VERSION_')) {
    exit;
}

/**
 * Updates module from previous versions to the version 1.0.1
 * Modify database: Update base URLs in advanced settings
 */
function upgrade_module_1_0_1()
{
    $previousShopContext = Shop::getContext();
    Shop::setContext(Shop::CONTEXT_ALL);

    $sql = 'SELECT * FROM ' . _DB_PREFIX_ . 'configuration WHERE name = "WORLDLINEOP_ADVANCED_SETTINGS"';
    $results = Db::getInstance()->executeS($sql);

    foreach ($results as $result) {
        if (!array_key_exists('value', $result) || empty($result['value'])) {
            continue;
        }

        $advancedSettingsArray = json_decode($result['value'], true);
        $shouldUpdate = false;

        if (array_key_exists('testEndpoint', $advancedSettingsArray) &&
            $advancedSettingsArray['testEndpoint'] == 'https://payment.preprod.ca.cawl-solutions.fr') {
            $advancedSettingsArray['testEndpoint'] = 'https://payment.preprod.cawl-solutions.fr';
            $shouldUpdate = true;
        }

        if (array_key_exists('prodEndpoint', $advancedSettingsArray) &&
            $advancedSettingsArray['prodEndpoint'] == 'https://payment.ca.cawl-solutions.fr') {
            $advancedSettingsArray['prodEndpoint'] = 'https://payment.cawl-solutions.fr';
            $shouldUpdate = true;
        }

        if (!$shouldUpdate) {
            continue;
        }

        Configuration::updateValue(
            'WORLDLINEOP_ADVANCED_SETTINGS',
            json_encode($advancedSettingsArray),
            false,
            $result['id_shop_group'],
            $result['id_shop']
        );
    }

    Shop::setContext($previousShopContext);

    return true;
}
