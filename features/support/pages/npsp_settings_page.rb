class NPSPSettingsPage
  include PageObject

  a(:account_model, text: 'Account Model')
  a(:addresses, text: 'Addresses')
  a(:batch_entry, text: 'Batch Data Entry')
  a(:donations, text: 'Donations')
  button(:edit_button, name: /EditNotif/)
  button(:edit_aff_button, value: 'Edit', index: 4)
  button(:edit_am_button, value: 'Edit')
  button(:edit_dbe_button, value: 'Edit', index:12)
  button(:edit_hh_button, value: 'Edit', index: 1)
  button(:edit_rc_button, value: 'Edit', index: 13)
  button(:edit_rel_button, value: 'Edit', index: 5)
  button(:edit_opp_button, name: /pbOppNaming/)
  a(:households, text: 'Households')
  span(:loading_message, class: 'loadingText')
  a(:opportunity_names, text: 'Opportunity Names')
  a(:people, text: 'People')
  table(:recip_settings_records_table, class: 'slds-table slds-table--bordered')
  a(:recurring_donations, text: 'Recurring Donations', index: 1)
  a(:second_recurring_donations, text: 'Recurring Donations', index: 2)
  a(:relationship_affiliations_settings, text: 'Affiliations')
  a(:relationship_reciprocal_settings, text: 'Relationship Reciprocal Settings')
  a(:relationships_second_settings, text: 'Relationships', index: 1)
  a(:relationships, text: 'Relationships')

  button(:save_button, name: /pbHH/, class: 'btn btn-sm btn-primary')
end
