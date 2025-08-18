{**
 * 2021 Worldline Online Payments
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0).
 * It is also available through the world-wide-web at this URL: https://opensource.org/licenses/AFL-3.0
 *
 * @author    PrestaShop / PrestaShop partner
 * @copyright 2020-2021 Worldline Online Payments
 * @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *
 *}

<div class="panel js-worldlineop-account-form">
  <form class="form-horizontal"
        action="#"
        name="worldlineop_account_form"
        id="worldlineop-account-form"
        method="post"
        enctype="multipart/form-data">
    <div class="row">
      <div class="worldlineop-account col-xs-12">
        <!-- Environment -->
        <div class="form-group js-worldlineop-env-block">
          <label class="control-label col-lg-3">
            <span>{l s='Environment' mod='cawlop'}</span>
          </label>
          <div class="col-lg-9 js-worldlineop-env-switch">
            <div class="radio">
              <label>
                <input type="radio"
                       name="worldlineopAccountSettings[environment]"
                       id="worldlineop-mode-test"
                       value="{$data.extra.const.ACCOUNT_MODE_TEST|escape:'html':'UTF-8'}"
                       {if $data.accountSettings.environment != $data.extra.const.ACCOUNT_MODE_PROD}checked="checked"{/if}>
                {l s='Test' mod='cawlop'}
              </label>
            </div>
            <div class="radio">
              <label>
                <input type="radio"
                       name="worldlineopAccountSettings[environment]"
                       id="worldlineop-mode-prod"
                       value="{$data.extra.const.ACCOUNT_MODE_PROD|escape:'html':'UTF-8'}"
                       {if $data.accountSettings.environment == $data.extra.const.ACCOUNT_MODE_PROD}checked="checked"{/if}>
                {l s='Production' mod='cawlop'}
              </label>
            </div>
          </div>
        </div>
        <!-- /Environment -->
        <div class="js-worldlineop-env-test-block">
          <h2 class="col-lg-offset-3 col-lg-9">{l s='Test credentials' mod='cawlop'}</h2>
          <!-- Test PSPID -->
          <div class="form-group">
            <label class="control-label col-lg-3">
              <span>{l s='Test PSPID' mod='cawlop'}</span>
            </label>
            <div class="col-lg-9">
              <div class="fixed-width-xxl">
                <input value="{$data.accountSettings.testPspid|escape:'htmlall':'UTF-8'}"
                       type="text"
                       name="worldlineopAccountSettings[testPspid]"
                       class="input fixed-width-xxl">
              </div>
            </div>
          </div>
          <!-- /Test PSPID -->
          <div class="alert alert-info">
            <p class="text-info">
              {l s='To retrieve the API Key and API secret in your PSPID, follow these steps:' mod='cawlop'}
            </p>
            <p class="text-info">
              {l s='> Login to the Back Office. Go to Configuration > Technical information > Ingenico Direct Settings > Direct API Key' mod='cawlop'}<br>
              {l s='> If you have not configured anything yet, the screen shows "No API credentials found". To create both API Key and API Secret click on "GENERATE"' mod='cawlop'}
            </p>
          </div>
          <!-- Test API Key -->
          <div class="form-group">
            <label class="control-label col-lg-3">
              <span>{l s='Test API Key' mod='cawlop'}</span>
            </label>
            <div class="col-lg-9">
              <div class="fixed-width-xxl">
                <input value="{$data.accountSettings.testApiKey|escape:'htmlall':'UTF-8'}"
                       type="text"
                       name="worldlineopAccountSettings[testApiKey]"
                       class="input fixed-width-xxl">
              </div>
            </div>
          </div>
          <!-- /Test API Key -->
          <!-- Test API Secret -->
          <div class="form-group">
            <label class="control-label col-lg-3">
              <span>{l s='Test API Secret' mod='cawlop'}</span>
            </label>
            <div class="col-lg-9">
              <div class="fixed-width-xxl">
                <input value="{$data.accountSettings.testApiSecret|escape:'htmlall':'UTF-8'}"
                       type="text"
                       name="worldlineopAccountSettings[testApiSecret]"
                       class="input fixed-width-xxl">
              </div>
            </div>
          </div>
          <!-- /Test API Secret -->
          <div class="alert alert-info">
            <p class="text-info">
              {l s='To retrieve the webhooks credentials, login to the Back Office.' mod='cawlop'}<br>
              {l s='Go to Configuration > Technical information > Ingenico Direct settings > Webhooks Configuration and perform the following steps:' mod='cawlop'}
            </p>
            <p class="text-info">
              {l s='> Click on "GENERATE WEBHOOKS API KEY"' mod='cawlop'}<br>
              {l s='> Copy & Paste the WebhooksKeySecret immediately' mod='cawlop'}<br>
              {l s='> In "Endpoints URLs", paste the Webhooks URL of your store - see below' mod='cawlop'}<br>
              {l s='> Click on "SAVE" to confirm your settings' mod='cawlop'}
            </p>
            <p>
              <i class="icon icon-warning"></i>
              {l s='If you have several shops & different credentials, please configure your Cawl portals for each shops/accounts.' mod='cawlop'}
            </p>
          </div>
          <!-- Test Webhooks Key -->
          <div class="form-group">
            <label class="control-label col-lg-3">
              <span>{l s='Test Webhooks Key' mod='cawlop'}</span>
            </label>
            <div class="col-lg-9">
              <div class="fixed-width-xxl">
                <input value="{$data.accountSettings.testWebhooksKey|escape:'htmlall':'UTF-8'}"
                       type="text"
                       name="worldlineopAccountSettings[testWebhooksKey]"
                       class="input fixed-width-xxl">
              </div>
            </div>
          </div>
          <!-- /Test Webhooks Key -->
          <!-- Test Webhooks Secret -->
          <div class="form-group">
            <label class="control-label col-lg-3">
              <span>{l s='Test Webhooks Secret' mod='cawlop'}</span>
            </label>
            <div class="col-lg-9">
              <div class="fixed-width-xxl">
                <input value="{$data.accountSettings.testWebhooksSecret|escape:'htmlall':'UTF-8'}"
                       type="text"
                       name="worldlineopAccountSettings[testWebhooksSecret]"
                       class="input fixed-width-xxl">
              </div>
            </div>
          </div>
        </div>
        <!-- /Test Webhooks Secret -->
        <div class="js-worldlineop-env-prod-block">
          <h2 class="col-lg-offset-3 col-lg-9">{l s='Production credentials' mod='cawlop'}</h2>
          <!-- Prod PSPID -->
          <div class="form-group">
            <label class="control-label col-lg-3">
              <span>{l s='Prod PSPID' mod='cawlop'}</span>
            </label>
            <div class="col-lg-9">
              <div class="fixed-width-xxl">
                <input value="{$data.accountSettings.prodPspid|escape:'htmlall':'UTF-8'}"
                       type="text"
                       name="worldlineopAccountSettings[prodPspid]"
                       class="input fixed-width-xxl">
              </div>
            </div>
          </div>
          <!-- /Prod PSPID -->
          <div class="alert alert-info">
            <p class="text-info">
              {l s='To retrieve the API Key and API secret in your PSPID, follow these steps:' mod='cawlop'}
            </p>
            <p class="text-info">
              {l s='> Login to the Back Office. Go to Configuration > Technical information > Ingenico Direct Settings > Direct API Key' mod='cawlop'}<br>
              {l s='> If you have not configured anything yet, the screen shows "No API credentials found". To create both API Key and API Secret click on "GENERATE"' mod='cawlop'}
            </p>
          </div>
          <!-- Prod API Key -->
          <div class="form-group">
            <label class="control-label col-lg-3">
              <span>{l s='Prod API Key' mod='cawlop'}</span>
            </label>
            <div class="col-lg-9">
              <div class="fixed-width-xxl">
                <input value="{$data.accountSettings.prodApiKey|escape:'htmlall':'UTF-8'}"
                       type="text"
                       name="worldlineopAccountSettings[prodApiKey]"
                       class="input fixed-width-xxl">
              </div>
            </div>
          </div>
          <!-- /Prod API Key -->
          <!-- Prod API Secret -->
          <div class="form-group">
            <label class="control-label col-lg-3">
              <span>{l s='Prod API Secret' mod='cawlop'}</span>
            </label>
            <div class="col-lg-9">
              <div class="fixed-width-xxl">
                <input value="{$data.accountSettings.prodApiSecret|escape:'htmlall':'UTF-8'}"
                       type="text"
                       name="worldlineopAccountSettings[prodApiSecret]"
                       class="input fixed-width-xxl">
              </div>
            </div>
          </div>
          <!-- /Prod API Secret -->
          <div class="alert alert-info">
            <p class="text-info">
              {l s='To retrieve the webhooks credentials, login to the Back Office.' mod='cawlop'}<br>
              {l s='Go to Configuration > Technical information > Ingenico Direct settings > Webhooks Configuration and perform the following steps:' mod='cawlop'}
            </p>
            <p class="text-info">
              {l s='> Click on "GENERATE WEBHOOKS API KEY"' mod='cawlop'}<br>
              {l s='> Copy & Paste the WebhooksKeySecret immediately' mod='cawlop'}<br>
              {l s='> In "Endpoints URLs", paste the Webhooks URL of your store - see below' mod='cawlop'}<br>
              {l s='> Click on "SAVE" to confirm your settings' mod='cawlop'}
            </p>
            <p class="text-info">
              <i class="icon icon-warning"></i>
              {l s='If you have several shops & different credentials, please configure your Cawl portals for each shops/accounts.' mod='cawlop'}
            </p>
          </div>
          <!-- Prod Webhooks Key -->
          <div class="form-group">
            <label class="control-label col-lg-3">
              <span>{l s='Prod Webhooks Key' mod='cawlop'}</span>
            </label>
            <div class="col-lg-9">
              <div class="fixed-width-xxl">
                <input value="{$data.accountSettings.prodWebhooksKey|escape:'htmlall':'UTF-8'}"
                       type="text"
                       name="worldlineopAccountSettings[prodWebhooksKey]"
                       class="input fixed-width-xxl">
              </div>
            </div>
          </div>
          <!-- /Prod Webhooks Key -->
          <!-- Prod Webhooks Secret -->
          <div class="form-group">
            <label class="control-label col-lg-3">
              <span>{l s='Prod Webhooks Secret' mod='cawlop'}</span>
            </label>
            <div class="col-lg-9">
              <div class="fixed-width-xxl">
                <input value="{$data.accountSettings.prodWebhooksSecret|escape:'htmlall':'UTF-8'}"
                       type="text"
                       name="worldlineopAccountSettings[prodWebhooksSecret]"
                       class="input fixed-width-xxl">
              </div>
            </div>
          </div>
          <!-- /Prod Webhooks Secret -->
        </div>

        <!-- Webhooks URL Mode -->
        <div class="form-group worldlineop-webhooks-block">
          <label class="control-label col-lg-3">
            {l s='Webhook URL Configuration' mod='cawlop'}
            <i id="js-webhook-mode-tooltip"
               class="icon-info-sign"
               data-toggle="tooltip"
               data-original-title=""></i>
          </label>

          <div class="col-lg-9">
        <span class="switch prestashop-switch fixed-width-lg">
            <input type="radio" value="automatic"
                   name="worldlineopAccountSettings[webhookMode]"
                   id="worldlineopAccountSettings_automatic"
                   {if $data.accountSettings.webhookMode == 'automatic'}checked="checked"{/if}>
            <label for="worldlineopAccountSettings_automatic" style="white-space: nowrap;">
                   {l s='Automatic (Recommended)' mod='cawlop'}
            </label>

            <input type="radio" value="manual"
                   name="worldlineopAccountSettings[webhookMode]"
                   id="worldlineopAccountSettings_manual"
                   {if $data.accountSettings.webhookMode == 'manual'}checked="checked"{/if}>
            <label for="worldlineopAccountSettings_manual">
                {l s='Manual' mod='cawlop'}
            </label>

            <a class="slide-button btn"></a>
        </span>
          </div>

          <div class="col-lg-offset-3 col-lg-9">
            <div class="help-block">
              <p>
                <strong>{l s='Automatic:' mod='cawlop'}</strong>
                {l s='The plugin automatically sends the webhook URL(s) with each transaction.' mod='cawlop'}<br>
                <strong>{l s='Manual:' mod='cawlop'}</strong>
                {l s='You must add your store webhook URL in the merchant portal.' mod='cawlop'}
              </p>
            </div>
          </div>
        </div>

        <div class="col-lg-12">
          <div class="alert alert-warning mt-2">
            <strong>{l s='Automatic:' mod='cawlop'}</strong>
            {l s='The URL(s) below will be used for transactions from this store, any webhook URL(s) configured in the merchant portal will be ignored.' mod='cawlop'}<br>
            <strong>{l s='Manual:' mod='cawlop'}</strong>
            {l s='You are fully responsible for adding your store webhook URL in the merchant portal.' mod='cawlop'}
            <strong>{l s=' Failure to do so could result in missing or incomplete orders!' mod='cawlop'}</strong>
          </div>
        </div>
        <!-- /Webhooks URL Mode -->

        <!-- Webhooks URL -->
        <div class="form-group worldlineop-webhooks-block">
          <label class="control-label col-lg-3">
            <span>{l s='Store Webhook URL' mod='cawlop'}</span>
            <i id="storeWebhookTooltip"
               class="icon-info-sign"
               data-toggle="tooltip"
               title="This is your store's unique address for receiving payment notifications. The plugin listens at this URL for real-time status updates to create and update your orders accordingly.">
            </i>
          </label>
          <div class="col-lg-9">
            <div class="form-control-static">
              <code id="js-webhooks-code">{$data.extra.path.controllers.webhooks|escape:'htmlall':'UTF-8'}</code>
              <i class="icon icon-copy js-icon-copy"></i>
            </div>
          </div>
          <div class="col-lg-offset-3 col-lg-9">
            <div class="help-block">
              <p id="js-webhook-help">{l s='This is your store webhook URL, it will be sent with each transaction.' mod='cawlop'}</p>
            </div>
          </div>
        </div>
        <!-- /Webhooks URL -->

        <!-- Automatic -->
        <div class="form-group worldlineop-webhooks-block js-additional-webhooks" style="display: none;">
          <label class="control-label col-lg-3">
            <span>{l s='Additional Webhook URLs' mod='cawlop'}</span>
          </label>
          <div class="col-lg-9">
            {assign var="urls" value=$data.accountSettings.additionalWebhookUrls}
            {assign var="count" value=$urls|@count}

            {foreach from=$urls item=url}
              <div class="form-group">
                <input type="text" class="form-control mb-2 additional-webhook"
                       placeholder="Optional"
                       name="worldlineopAccountSettings[additionalWebhookUrls][]"
                       value="{$url|escape:'htmlall':'UTF-8'}"
                       maxlength="325" />
              </div>
            {/foreach}

            {section name=i start=$count loop=4}
              <div class="form-group">
                <input type="text" class="form-control mb-2 additional-webhook"
                       placeholder="Optional"
                       name="worldlineopAccountSettings[additionalWebhookUrls][]"
                       maxlength="325" />
              </div>
            {/section}

            <div class="help-block">
              <p>{l s='You can add up to 4 additional webhook URLs' mod='cawlop'}</p>
            </div>
          </div>

          <!-- /Automatic enable -->


          <input type="hidden" name="action" value="saveAccountForm"/>
        </div>
      </div>
      <div class="panel-footer">
        <button type="submit" class="btn btn-default pull-right" name="submitSaveAccountForm">
          <i class="process-icon-save"></i> {l s='Save' mod='cawlop'}
        </button>
        <button type="submit" class="btn btn-default pull-right" name="submitTestCredentialsForm">
          <i class="process-icon-ok"></i> {l s='Save & Check credentials' mod='cawlop'}
        </button>
      </div>
  </form>
</div>

{literal}
  <script type="text/javascript">
    function copyInput($input) {
      let range = document.createRange();
      let sel = window.getSelection();

      range.setStartBefore($input.firstChild);
      range.setEndAfter($input.lastChild);
      sel.removeAllRanges();
      sel.addRange(range);

      try {
        document.execCommand('copy');
        showSuccessMessage(copyMessage);
      } catch (err) {
        console.error('Unable to copy');
      }
    }

    $('.js-icon-copy').on('click', function (e) {
      copyInput(document.getElementById('js-webhooks-code'));
    });
  </script>

  <script>
    document.addEventListener('DOMContentLoaded', function () {
      const automaticRadio = document.getElementById('worldlineopAccountSettings_automatic');
      const manualRadio = document.getElementById('worldlineopAccountSettings_manual');
      const additionalWebhooksBlock = document.querySelector('.js-additional-webhooks');
      const copyIcon = document.querySelector('.js-icon-copy');
      const saveButtons = document.querySelectorAll('button[name="submitSaveAccountForm"], button[name="submitTestCredentialsForm"]');
      const regex = /^https:\/\/[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(\/.*)?$/;

      function toggleAdditionalWebhooks() {
        if (automaticRadio.checked) {
          additionalWebhooksBlock.style.display = 'flex';
          copyIcon.style.display = 'none';
        } else {
          additionalWebhooksBlock.style.display = 'none';
          copyIcon.style.display = 'inline-block';
        }
      }

      function validateInputs() {
        let isValid = true;
        document.querySelectorAll('.additional-webhook').forEach(input => {
          const value = input.value.trim();

          let errorMsg = input.nextElementSibling;
          if (!errorMsg || !errorMsg.classList.contains('error-message')) {
            errorMsg = document.createElement('div');
            errorMsg.classList.add('error-message');
            errorMsg.style.color = 'red';
            errorMsg.style.fontSize = '12px';
            errorMsg.style.marginTop = '3px';
            input.insertAdjacentElement('afterend', errorMsg);
          }

          input.classList.remove('is-invalid');
          errorMsg.textContent = '';

          if (value !== '' && (!value.startsWith('https://') || !regex.test(value) || value.length > 325)) {
            input.classList.add('is-invalid');
            input.style.border = '1px solid red';
            errorMsg.textContent = 'Please enter a valid HTTPS URL (max 325 chars).';
            isValid = false;
          } else {
            input.style.border = '';
          }
        });

        saveButtons.forEach(btn => btn.disabled = !isValid);
      }

      document.querySelectorAll('.additional-webhook').forEach(input => {
        input.addEventListener('input', validateInputs);
      });

      toggleAdditionalWebhooks();
      automaticRadio.addEventListener('change', toggleAdditionalWebhooks);
      manualRadio.addEventListener('change', toggleAdditionalWebhooks);

      document.getElementById('worldlineop-account-form').addEventListener('submit', function (e) {
        validateInputs();
        if (document.querySelector('.is-invalid')) {
          e.preventDefault();
        }
      });
    });

    document.addEventListener('DOMContentLoaded', function () {
      const tooltipIcon = document.getElementById('js-webhook-mode-tooltip');
      const automaticRadio = document.getElementById('worldlineopAccountSettings_automatic');
      const manualRadio = document.getElementById('worldlineopAccountSettings_manual');

      const autoText = "Automatic Mode Explained: The plugin automatically sends the store webhook URL with every payment request, which is the safest and most reliable option. This mode also allows you to add up to 4 additional URLs to send notifications to external services, like accounting or subscription management. Please be aware that in this mode, any webhook URLs configured in your merchant portal will be ignored for transactions originating from this specific store.";
      const manualText = "Manual Mode Explained: You will be required to manually copy the Store Webhook URL and paste it into your merchant portal's webhook configuration. Crucially for multistore users, this URL is unique for each store, and this process must be repeated for every single one.";

      function updateTooltipText() {
        const newText = automaticRadio.checked ? autoText : manualText;
        $(tooltipIcon)
                .attr('data-original-title', newText)
                .tooltip('dispose')
                .tooltip({ title: newText, placement: 'right' });
      }

      $(tooltipIcon).tooltip({ title: autoText, placement: 'right' });
      $('#storeWebhookTooltip').tooltip();

      automaticRadio.addEventListener('change', updateTooltipText);
      manualRadio.addEventListener('change', updateTooltipText);
    });

  </script>
{/literal}
