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