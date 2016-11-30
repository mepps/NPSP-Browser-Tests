
When(/^I change Relationships Gender Field settings$/) do
  on(NPSPSettingsPage).edit_rel_button_element.when_present.click
  step 'I wait for the page to revert'

  on(NPSPRelationshipsSettingsPage) do |page|
    page.gender_field_select_element.when_present(10)
    page.gender_field_select='Level'
  end

end

When(/^I click Save Relationships Settings$/) do
  api_client do
    @relationships_settings = @api_client.query('select Id,
                                       Name,
                                       npe4__Gender_Field__c
                                       from npe4__Relationship_Settings__c')
  end

  sleep 1
  on(NPSPRecurringDonationsSettingsPage).save_button
end

Then(/^Relationships settings should be saved$/) do
  on(NPSPRelationshipsSettingsPage) do |page|
    page.page_gender_element.when_present(15)
    expect(page.page_gender_element).to be_visible
  end
end

Then(/^when I refresh the Relationships Relationships page my changes should be visible$/) do
  @browser.refresh
  step 'I navigate to Relationships Relationships'
  sleep 1
  step 'Relationships settings should be saved'
end
