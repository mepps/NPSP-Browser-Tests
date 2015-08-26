class NPSPContactsPage
  include PageObject

  a(:delete_button, href: /deleteredirect/, index: 1)
  button(:new_button, title: 'New')
  text_field(:last_name_field, id: 'name_lastcon2')
  div(:name_field, id: 'con2_ileinner')
  button(:save_button, name: 'save')
end