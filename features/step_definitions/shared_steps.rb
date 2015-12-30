Given(/^I create a new Contact via the API$/) do
  create_contact_via_api("aaaatestcontact#{@random_string}", '', '', '', '')
end

Given(/^I create a new Contact via the API with address "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/) do |city, state, country, zip|
  create_contact_via_api("aaaatestcontact#{@random_string}", city, state, country, zip)
end

Given(/^I create a new Opportunity via the API with stage name "([^"]*)" and close date "([^"]*)" and amount "([^"]*)"$/) do |stage_name, close_date, amount|
  create_opportunity_via_api("aaaatestopp#{@random_string}", stage_name, close_date, amount)
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

Then(/^I should see the Payment page$/) do
  on(PaymentWizardPage) do |page|
    page.wait_until do
      page.payment_page_header_element.visible? == true
    end
    expect(page.payment_page_header).to eq 'Payment'
  end
end

Then(/^the payment amount should be "([^"]*)"$/) do |payment_amount|
  expect(on(PaymentWizardPage).payment_page_amount).to eq payment_amount
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
