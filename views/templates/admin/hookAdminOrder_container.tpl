{**
 * 2021 Crédit Agricole
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0).
 * It is also available through the world-wide-web at this URL: https://opensource.org/licenses/AFL-3.0
 *
 * @author    PrestaShop / PrestaShop partner
 * @copyright 2020-2021 Crédit Agricole
 * @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *
 *}

<div id="worldlineop-admin-order-container">
  {if $theme == 'legacy'}
    {include file="./hookAdminOrder_legacy.tpl"}
  {else}
    {include file="./hookAdminOrder_new-theme.tpl"}
  {/if}
</div>
{include file="./hookAdminOrder_script.tpl"}
