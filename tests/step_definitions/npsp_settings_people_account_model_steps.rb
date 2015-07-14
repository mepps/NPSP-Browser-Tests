When(/^I retrieve current settings for Account Model, Household Account Record Type, One\-to\-One Record Type$/) do
  on(NPSPAccountModelSettingsPage) do |page|
    @account_model_setting = page.account_model_select
    @household_account_record_type = page.household_account_record_type
    @one_to_one_record_type = page.one_to_one_record_type
  end
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
  if @account_model_setting == '- none -'
    @account_model_setting = ''
  end
  if @household_account_record_type == '- none -'
    @household_account_record_type = ''
  end
  if @one_to_one_record_type == '- none -'
    @one_to_one_record_type = ''
  end

  expect(on(NPSPAddressSettingsPage).page_contents).to match /#{@account_model_setting}.+#{@household_account_record_type}.+#{@one_to_one_record_type}/m
end
