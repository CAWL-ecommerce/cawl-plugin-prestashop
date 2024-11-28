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

{extends file='page.tpl'}

{block name='page_content_container'}
  <div id="worldlineop-rejected-message">
    <div class="alert alert-warning">
      <p>{l s='There was an issue with your payment, and you have not been charged.' mod='cawlop'}</p>
      <p>
        {l s='Please double check your emails and click' mod='cawlop'}
        <a href="{$reorder_link}" >{l s='here' mod='cawlop'}</a>
        {l s='if you wish to re-order.' mod='cawlop'}
      </p>
    </div>
  </div>
{/block}
