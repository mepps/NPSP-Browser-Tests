class NPSPContactsPage
  include PageObject

  button(:new_button, title: 'New')
  text_field(:last_name_field, id: 'name_lastcon2')
  div(:results_feed, id: 'feedwrapper')
  button(:save_button, name: 'save')
end