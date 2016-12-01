
When(/^I change Recurring Donations settings$/) do
  on(NPSPRecurringDonationsSettingsPage) do |page|
    on(NPSPSettingsPage).edit_rc_button_element.when_present.click
    step 'I wait for the page to revert'
    5.times do
      page.opp_forecast_months_element.when_present.click
      page.opp_forecast_months_element.send_keys( :backspace )
    end
    page.opp_forecast_months_element.send_keys('24')
    page.opp_behavior='Delete_Open_Opportunities'
  end
end

When(/^I click Save Recurring Donations Settings$/) do
  api_client do
    @recurring_donations_settings = @api_client.query('select Id,
                                       Name,
                                       npe03__Opportunity_Forecast_Months__c,
                                       npe03__Open_Opportunity_Behavior__c
                                       from npe03__Recurring_Donations_Settings__c').first
  end

  sleep 1
  on(NPSPRecurringDonationsSettingsPage).save_button
end

Then(/^Recurring Donations settings should be saved$/) do
  on(NPSPRecurringDonationsSettingsPage) do |page|
    page.page_opp_forecast_months_saved_element.when_present(15)
    expect(page.page_opp_forecast_months_saved_element).to be_visible
    expect( page.page_opp_behavior_saved_element).to be_visible
  end
end

Then(/^when I refresh the page my changes should be visible$/) do
  @browser.refresh
  step 'I navigate to Recurring Donations Recurring Donations'
  sleep 1
  step 'Recurring Donations settings should be saved'
end
