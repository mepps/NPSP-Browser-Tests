class NPSPSettingsPage
  include PageObject

  a(:account_model, text: 'Account Model')
  a(:addresses, text: 'Addresses')
  a(:donations, text: 'Donations')
  button(:edit_button, name: /EditNotif/)
  button(:edit_am_button, value: 'Edit')
  button(:edit_hh_button, value: 'Edit', index: 1)
  button(:edit_rc_button, value: 'Edit', index: 13)
  button(:edit_opp_button, name: /pbOppNaming/)
  a(:households, text: 'Households')
  span(:loading_message, class: 'loadingText')
  a(:opportunity_names, text: 'Opportunity Names')
  a(:people, text: 'People')
  table(:recip_settings_records_table, class: 'slds-table slds-table--bordered')
  a(:recurring_donations, text: 'Recurring Donations', index: 1)
  a(:second_recurring_donations, text: 'Recurring Donations', index: 2)
  a(:relationship_reciprocal_settings, text: 'Relationship Reciprocal Settings')
  a(:relationships_second_settings, text: 'Relationships', index: 1)
  a(:relationships, text: 'Relationships')

  button(:save_button, name: /pbHH/, class: 'btn btn-sm btn-primary')
end
