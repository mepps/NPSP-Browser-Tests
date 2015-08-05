When(/^I fill in last name$/) do
  on(NPSPContactsPage).last_name_field_element.send_keys "#{@random_string} Test automation last name"
end

When(/^I click Save$/) do
  on(NPSPContactsPage).save_button
end

Then(/^I should see the confirmation screen with the new contact info$/) do
  expect(on(NPSPContactsPage).results_feed).to match "changed Account Name from a blank value to #{@random_string} Test automation last name"
end

Then(/^I should see the Household account for the new contact$/) do
  step 'I click the Accounts tab'
  step 'I select "Household Accounts" and Go'
  expect(on(ManageHouseholdsPage).households_list).to match /#{Regexp.quote(@random_string)} Test automation last name.+#{Regexp.quote(@random_string)} Test automation last name.+#{Regexp.quote(@random_string)} Test automation last name/m
end

#{Regexp.quote(foo)}