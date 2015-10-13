class NPSPMainPage
  include PageObject

  a(:accounts_tab, class: 'accountBlock')
  a(:contacts_tab, class: 'contactBlock')
  a(:getting_started_link, class: 'Custom64Block')
  a(:recurring_donations_link, class: 'Custom40Block')
  a(:npsp_settings_link, text: 'NPSP Settings')
  a(:contact_merge_link, text: 'Contact Merge')
  div(:home_page_text, class: 'content')
  div(:npsp_home_page_text, class: 'jumbotron')
  button(:new_recurring_donations_button, name: 'new')
end
