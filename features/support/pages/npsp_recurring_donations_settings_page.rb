class NPSPRecurringDonationsSettingsPage
  include PageObject

  text_field(:opp_forecast_months, value: '12')
  select_list(:opp_behavior, id: /slOOB/)
end
