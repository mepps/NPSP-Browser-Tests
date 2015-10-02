class NPSPRecurringDonationsPage
  include PageObject

  button(:new_button, name: 'new')
  select(:period_select, index: 1)
  text_field(:installments_field, index: 8)
  text_field(:amount, index: 7)
  text_field(:donation_name, id: 'Name')
  button(:save_button, name: 'save')
  text_field(:contact_field, index: 5)
  div(:donations_section, class: 'bPageBlock', index: 1)
  a(:delete_link, text: 'Del')
  button(:refresh_button, name: 'npe03__refresh_opportunities')
  end