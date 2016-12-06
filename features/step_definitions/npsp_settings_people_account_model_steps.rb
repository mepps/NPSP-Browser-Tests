When(/^I retrieve current settings for Account Model, Household Account Record Type, One\-to\-One Record Type$/) do
  on(NPSPAccountModelSettingsPage) do |page|
    @account_model_setting = page.account_model_select
    @household_account_record_type = page.household_account_record_type
    @one_to_one_record_type = page.one_to_one_record_type
  end
end

When(/^I click Edit People Account Model$/) do
  on(NPSPSettingsPage).edit_am_button_element.when_present.click
  step 'I wait for the page to revert'
end

When(/^I click Save Account Model Settings$/) do
  api_client do
    @these_settings =  select_api 'select Id,
                                       Name,
                                       npe01__HH_Account_RecordTypeID__c
                                       from Contacts_And_Orgs_Settings'
  end

  @these_settings = @these_settings.first

  sleep 1
  on(NPSPRecurringDonationsSettingsPage).save_button
end

When(/^I set Account Model to "([^"]*)"$/) do |account_model_value|
  on(NPSPAccountModelSettingsPage).account_model_select = account_model_value
end

When(/^I set Household Account Record Type to "([^"]*)"$/) do |household_record_type|
  on(NPSPAccountModelSettingsPage).household_account_record_type = household_record_type
end

When(/^I set One\-to\-One Record Type to "([^"]*)"$/) do |one_to_one_type|
  on(NPSPAccountModelSettingsPage).one_to_one_record_type = one_to_one_type
end

Then(/^I should see the default Account Model settings on the page$/) do
  #value "- none -" appears on the edit page but does not appear on the display page
  if @account_model_setting == '--None--'
    @account_model_setting = ''
  end
  if @household_account_record_type == '--None--'
    @household_account_record_type = ''
  end
  if @one_to_one_record_type == '--None--'
    @one_to_one_record_type = ''
  end

  expect(on(NPSPAddressSettingsPage).page_contents).to match /#{@account_model_setting}.+#{@household_account_record_type}.+#{@one_to_one_record_type}/m
end

Then(/^Account Model settings should be saved$/) do
  expect(on(NPSPAccountModelSettingsPage).changed_account_model_element.when_present(15)).to be_visible
end

Then(/^when I refresh the Account Model Settings page my Account Model changes should be visible$/) do
  @browser.refresh
  step 'I navigate to Settings People Account Model'
  sleep 1
  step 'Account Model settings should be saved'
end
