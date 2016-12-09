When(/^I change Donations Batch Entry settings$/) do
  on(NPSPDonationsSettingsPage).unsaved_page_donations_element.when_present

  on(NPSPSettingsPage).edit_dbe_button_element.when_present.click
  step 'I wait for the page to revert'

  on(NPSPDonationsSettingsPage) do |page|
    page.opp_naming_checkbox_element.when_present(15)
    page.uncheck_opp_naming_checkbox
  end
end

When(/^I change Donations Contact Roles settings$/) do
  on(NPSPDonationsSettingsPage) do |page|
    page.unsaved_contact_roles_element.when_present
    page.saved_contact_role_element.when_not_present

  on(NPSPSettingsPage).edit_cr_button_element.when_present.click
  step 'I wait for the page to revert'

    page.contact_roles_element.when_present(15)
    page.contact_roles = 'Business User'
  end
end

When(/^I click Save Donations Contact Roles settings$/) do
  api_client do
    @these_settings = select_api 'select Id,
                                          Name,
                                          npo02__Household_Member_Contact_Role__c
                                          from Households_Settings'
  end

  @these_settings = @these_settings.first

  sleep 1
  on(NPSPRecurringDonationsSettingsPage).save_button
end

Then(/^Donations Batch Entry settings should be saved$/) do
  on(NPSPDonationsSettingsPage) do |page|
    page.saved_opp_naming_checkbox_element.when_present(15)
    expect(page.saved_opp_naming_checkbox_element).to be_visible
  end
end

Then(/^when I refresh the Donations Batch Entry page my changes should be visible$/) do
  @browser.refresh
  step 'I navigate to Settings Donations Batch Entry'
  sleep 1
  step 'Donations Batch Entry settings should be saved'
end

Then(/^Donations Contact Roles settings should be saved$/) do
  on(NPSPDonationsSettingsPage) do |page|
    page.saved_contact_role_element.when_present(15)
    expect(page.saved_contact_role_element).to be_visible
  end
end

Then(/^when I refresh the Donations Contact Roles page my changes should be visible$/) do
  @browser.refresh
  step 'I navigate to Settings Donations Contact Roles'
  sleep 1
  step 'Donations Contact Roles settings should be saved'
end
