class NPSPSettingsPage
  include PageObject

  a(:account_model, text: 'Account Model')
  a(:addresses, text: 'Addresses')
  button(:edit_button, name: /EditNotif/)
  button(:edit_am_button, value: 'Edit')
  button(:edit_hh_button, name: /pbHH/)
  a(:households, text: 'Households')
  span(:loading_message, class: 'loadingText')
  a(:people, text: 'People')
end
