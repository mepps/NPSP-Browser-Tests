
When(/^I change Relationships Reciprocal Method settings$/) do
  on(NPSPRelationshipsSettingsPage).unsaved_page_reciprocal_method_element.when_present

  on(NPSPSettingsPage).edit_rel_button_element.when_present.click
  sleep 10
  step 'I wait for the page to revert'

  on(NPSPRelationshipsSettingsPage) do |page|
    page.reciprocal_method_select_element.when_present(15)
    page.reciprocal_method_select='Value Inversion'
  end

end

When(/^I click Save Relationships Settings$/) do
  api_client do
    @relationships_settings = @api_client.query('select Id,
                                       Name,
                                       npe4__Reciprocal_Method__c
                                       from npe4__Relationship_Settings__c').first
  end

  sleep 1
  on(NPSPRecurringDonationsSettingsPage).save_button
end

Then(/^Relationships settings should be saved$/) do
  on(NPSPRelationshipsSettingsPage) do |page|
    page.page_reciprocal_method_element.when_present(15)
    expect(page.page_reciprocal_method_element).to be_visible
  end
end

Then(/^when I refresh the Relationships Relationships page my changes should be visible$/) do
  @browser.refresh
  step 'I navigate to Relationships Relationships'
  sleep 1
  step 'Relationships settings should be saved'
end
