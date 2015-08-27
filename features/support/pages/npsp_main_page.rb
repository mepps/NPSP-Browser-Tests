class NPSPMainPage
  include PageObject
  a(:accounts_tab, text: 'Accounts')
  a(:contacts_tab, text: 'Contacts')
  a(:recurring_donations_link, text: 'Recurring Donations')
  a(:npsp_settings_link, text: 'NPSP Settings')
  div(:home_page_text, class: 'content')
  div(:npsp_home_page_text, class: 'jumbotron')
  button(:new_recurring_donations_button, name: 'new')
end
