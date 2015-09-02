Given(/^I login with oauth$/) do
  visit(LoginPage).login_with_oauth
  on(LoginPage) do |page|
    page.app_switcher_element.when_present.click
    begin
      #WE ONLY NEED TO CLICK NPSP AFTER A FRESH INSTALL
      #DON'T FAIL THE TEST IF NPSP IS ALREADY SELECTED
      page.npsp_app_picker_element.when_present.click
      rescue
    end
    page.app_switcher_element.when_present.click
  end

  #REMOVE THE CODE BELOW WHEN https://github.com/SalesforceFoundation/Cumulus/issues/1694 is FIXED
  step 'I click the NPSP Settings link'
  step 'I navigate to Settings People Households'

  on(NPSPSettingsPage) do |page|
    page.wait_until do
      page.edit_hh_button_element.disabled? == false
    end
  sleep 1
    page.edit_hh_button
  end

  step 'I wait for the page to revert'
  sleep 1
  on(NPSPSettingsPage) do |page|
    page.wait_until do
      page.save_button_element.disabled? == false
  end
  sleep 1
    page.save_button
  end
  #step 'I wait for the page to revert'
  #REMOVE THE CODE ABOVE WHEN https://github.com/SalesforceFoundation/Cumulus/issues/1694 is FIXED
end

Given(/^I login to settings with oauth$/) do
  visit(LoginPage).login_with_oauth
  step 'I click the NPSP Settings link'
end

When(/^I click Cancel$/) do
  on(ManageHouseholdsPage) do |page|
    page.wait_until do
      page.cancel_button_element.disabled? == false
    end
    sleep 1
    page.cancel_button
  end
end

When(/^I wait for the page to revert$/) do
  on(NPSPSettingsPage) do |page|
    page.wait_until(15) do
      page.loading_message_element.visible? == false
    end
  end
end

# THE STEPS BELOW ARE NEVER TO BE USED IN A JENKINS BUILD
# BECAUSE THEY LEAK PASSWORDS IN THE SAUCELABS SELENIUM LOGS.
# PLEASE USE THE OAUTH LOGIN STEPS ABOVE INSTEAD

Given(/^I login with environment variables$/) do
  visit(LoginPage).login_with_env_vars
end

Given(/^I login to settings with environment variables$/) do
  visit(LoginPage, using_params: {:redirect_to => '?startURL=apex%2FSTG_SettingsManager'}) do |page|
    page.login_with_env_vars
  end
end

Given(/^I delete the account$/) do
  delete_account_via_api
end