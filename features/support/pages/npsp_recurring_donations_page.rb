class NPSPRecurringDonationsPage
  include PageObject

  text_field(:amount, index: 7)
  text_field(:contact_field, index: 5)
  a(:delete_link, text: 'Del')
  text_field(:donation_name, id: 'Name')
  div(:donations_section, class: 'bPageBlock', index: 1)
  text_field(:installments_field, index: 8)
  button(:new_button, name: 'new')
  select(:period_select, index: 1)
  button(:refresh_button, name: 'npe03__refresh_opportunities')
  button(:save_button, name: 'save')
end
