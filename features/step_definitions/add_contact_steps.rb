When(/^I fill in last name$/) do
  on(NPSPContactsPage).last_name_field_element.send_keys "#{@random_string} Test automation last name"
end

When(/^I click Save$/) do
  on(NPSPContactsPage).save_button
end

When(/^I delete the contact$/) do
  on(NPSPContactsPage).delete_button
  @browser.alert.ok
end

Then(/^I should see the new contact name$/) do
  expect(on(NPSPContactsPage).name_field).to match "#{@random_string} Test automation last name"
end

Then(/^I should see the Household account for the new contact$/) do
  step 'I click the Accounts tab'
  step 'I select "All Accounts" and Go'
  expect(on(ManageHouseholdsPage).households_list).to match /#{Regexp.quote(@random_string)} Test automation last name/m
end

#{Regexp.quote(foo)}