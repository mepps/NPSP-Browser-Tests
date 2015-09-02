class NPSPSettingsPage
  include PageObject

  a(:account_model, text: 'Account Model')
  a(:addresses, text: 'Addresses')
  a(:donations, text: 'Donations')
  button(:edit_button, name: /EditNotif/)
  button(:edit_am_button, value: 'Edit')
  button(:edit_hh_button, name: /pbHH/, class: 'btn btn-sm btn-primary')
  button(:edit_opp_button, name: /pbOppNaming/)
  a(:households, text: 'Households')
  span(:loading_message, class: 'loadingText')
  a(:opportunity_names, text: 'Opportunity Names')
  a(:people, text: 'People')
  button(:save_button, name: /pbHH/, class: 'btn btn-sm btn-primary')
end
