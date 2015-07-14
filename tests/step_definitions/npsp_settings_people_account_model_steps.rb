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
  expect(on(NPSPAddressSettingsPage).page_contents).to match /.+Household Account.+Household Account/m
end

Then(/^the value for Account Model should be "([^"]*)"$/) do |default_setting|
  expect(on(NPSPAccountModelSettingsPage).account_model_select).to be == default_setting
end

Then(/^the value for Household Account Record Type should be "([^"]*)"$/) do |default_setting|
  expect(on(NPSPAccountModelSettingsPage).household_account_record_type).to be == default_setting
end

Then(/^the value for One\-to\-One Record Type should be "([^"]*)"$/) do |default_setting|
  expect(on(NPSPAccountModelSettingsPage).one_to_one_record_type).to be == default_setting
end