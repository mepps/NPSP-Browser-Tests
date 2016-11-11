
When(/^I change Recurring Donations settings$/) do
  on(NPSPRecurringDonationsSettingsPage) do |page|
    5.times do
      page.opp_forecast_months_element.when_present.click
      page.opp_forecast_months_element.send_keys( :backspace )
    end
    page.opp_forecast_months_element.send_keys('24')
    page.opp_behavior='Delete_Open_Opportunities'
  end
end

When(/^I save Recurring Donations settings$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^Recurring Donations settings should be saved$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click Save Recurring Donations Settings$/) do
  api_client do
    @recurring_donations_settings = @api_client.query('select Id,
                                       Name,
                                       npe03__Opportunity_Forecast_Months__c,
                                       npe03__Open_Opportunity_Behavior__c,
                                       from npe03__Recurring_Donations_Settings__c')
  end

  sleep 1
  on(NPSPSettingsPage).save_button
end