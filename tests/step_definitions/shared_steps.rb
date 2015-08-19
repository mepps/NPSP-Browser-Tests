Given(/^I login with oauth$/) do
  visit(LoginPage).login_with_oauth
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
    page.wait_until(10) do
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