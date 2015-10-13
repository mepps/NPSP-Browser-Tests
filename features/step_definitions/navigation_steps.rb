Given(/^I navigate to Manage Households UI$/) do
  @browser.goto($target_org_url + '/apex/HH_ManageHHAccount?scontrolCaching=1&id=' + @account_id)
end

Given(/^I navigate to New Contact$/) do
  on(NPSPMainPage).contacts_tab_element.when_present.click
  on(NPSPContactsPage).new_button
end

Given(/^I navigate to Payment Wizard for that Opportunity$/) do
  @browser.goto($target_org_url + '/apex/PMT_PaymentWizard?id=' + @opportunity_id + '&wtype=payment')
end

Given(/^I navigate to Relationship Viewer for the Primary Contact$/) do
  @browser.goto($target_org_url + '/apex/REL_RelationshipsViewer?id=' + @array_of_contacts[0])
end

Given(/^I navigate to Recurring Donations$/) do
  on(NPSPMainPage).recurring_donations_link_element.when_present(10).click
end

Given(/^I navigate to Contact Merge$/) do
  on(NPSPMainPage).contact_merge_link_element.when_present(10).click
end

Given(/^I navigate to Settings Donations Opportunity Names$/) do
  on(NPSPSettingsPage) do |page|
    page.donations_element.when_present.click
    page.opportunity_names_element.when_present.click
    page.edit_opp_button_element.when_present.click
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

Given(/^I navigate to Settings People Households$/) do
  on(NPSPSettingsPage) do |page|
    page.people_element.when_present.click
    page.households_element.when_present.click
    page.edit_hh_button_element.when_present.click
    step 'I wait for the page to revert'
  end
end
