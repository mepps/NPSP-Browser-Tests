Given(/^I navigate to Manage Households UI$/) do
  step 'I click the Accounts tab'
  step 'I select "My Accounts" and Go'
  step 'I click the first Household Account'
  step 'I click Manage Household'
end

Given(/^I navigate to New Contact$/) do
  on(NPSPMainPage).contacts_tab_element.when_present.click
  on(NPSPContactsPage).new_button
end

Given(/^I navigate to Settings People Households$/) do
  on(NPSPSettingsPage) do |page|
    page.people_element.when_present.click
    page.households_element.when_present.click
    page.edit_hh_button_element.when_present.click
    step 'I wait for the page to revert'
  end
end

Given(/^I navigate to Settings People Account Model$/) do
  on(NPSPSettingsPage) do |page|
    page.people_element.when_present.click
    page.account_model_element.when_present.click
    page.edit_am_button_element.when_present.click
    step 'I wait for the page to revert'
  end
end

Given(/^I navigate to Settings People Addresses$/) do
  on(NPSPSettingsPage) do |page|
    page.people_element.when_present.click
    page.addresses_element.when_present.click
    page.edit_button_element.when_present.click
    step 'I wait for the page to revert'
  end
end

Given(/^I navigate to Settings Donations Opportunity Names$/) do
  on(NPSPSettingsPage) do |page|
    page.donations_element.when_present.click
    page.opportunity_names_element.when_present.click
    page.edit_opp_button_element.when_present.click
    step 'I wait for the page to revert'
  end
end