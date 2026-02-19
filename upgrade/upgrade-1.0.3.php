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
 *
 */

if (!defined('_PS_VERSION_')) {
    exit;
}

const ADVANCED_SETTINGS_COLUMN_NAME = 'WORLDLINEOP_ADVANCED_SETTINGS';
const THREE_DS_EXEMPTED_DEFAULT_TYPE = 'low-value';
const THREE_DS_EXEMPTED_DEFAULT_VALUE = '30';

/**
 * Updates module from previous versions to the version 1.0.3
 * Modify database: Update threeDS advanced settings
 */
function upgrade_module_1_0_3()
{
    $previousShopContext = Shop::getContext();
    Shop::setContext(Shop::CONTEXT_ALL);

    $db = DB::getInstance();

    $sql = 'SELECT * FROM ' . _DB_PREFIX_ . 'configuration WHERE name = "WORLDLINEOP_ADVANCED_SETTINGS"';
    $results = $db->executeS($sql);

    foreach ($results as $result) {
        if (!array_key_exists('value', $result) || empty($result['value'])) {
            continue;
        }
        $advancedSettingsArray = json_decode($result['value'], true);

        if (shouldUpdateThreeDSConfiguration($advancedSettingsArray)) {
            $advancedSettingsArray['threeDSExemptedType'] = THREE_DS_EXEMPTED_DEFAULT_TYPE;
            $advancedSettingsArray['threeDSExemptedValue'] = THREE_DS_EXEMPTED_DEFAULT_VALUE;
        }

        Configuration::updateValue(
            ADVANCED_SETTINGS_COLUMN_NAME,
            json_encode($advancedSettingsArray),
            false,
            $result['id_shop_group'],
            $result['id_shop']
        );
    }

    $sql = 'UPDATE ' . _DB_PREFIX_ . 'configuration
        SET name = CASE 
            WHEN name = "WORLDLINEOP_ADVANCED_SETTINGS" THEN "CAWLOP_ADVANCED_SETTINGS"
            WHEN name = "WORLDLINEOP_SHOW_ADVANCED_SETTINGS" THEN "CAWLOP_SHOW_ADVANCED_SETTINGS"
            WHEN name = "WORLDLINEOP_ACCOUNT_SETTINGS" THEN "CAWLOP_ACCOUNT_SETTINGS"
            WHEN name = "WORLDLINEOP_PAYMENT_METHODS_SETTINGS" THEN "CAWLOP_PAYMENT_METHODS_SETTINGS"
        END
        WHERE name IN (
            "WORLDLINEOP_ADVANCED_SETTINGS",
            "WORLDLINEOP_ACCOUNT_SETTINGS",
            "WORLDLINEOP_PAYMENT_METHODS_SETTINGS",
            "WORLDLINEOP_SHOW_ADVANCED_SETTINGS"
        )';

    $db->execute($sql);

    Shop::setContext($previousShopContext);

    return true;
}

/**
 * @param array $advancedSettingsArray
 *
 * @return bool
 */
function shouldUpdateThreeDSConfiguration($advancedSettingsArray)
{
    return array_key_exists('threeDSExempted', $advancedSettingsArray) && $advancedSettingsArray['threeDSExempted'];
}
