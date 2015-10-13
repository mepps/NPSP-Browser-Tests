class NPSPContactMergePage
  include PageObject

  text_field(:contact_search_box, id: 'contactMergePage:searchForm:searchText')
  button(:contact_search_button, id: 'contactMergePage:searchForm:searchButton')
  checkbox(:contact_checkbox_first, name: /contactMergePage.+checkedone/, index:0)
  checkbox(:contact_checkbox_second, name: /contactMergePage.+checkedone/, index:1)
  checkbox(:contact_checkbox_third, name: /contactMergePage.+checkedone/, index:2)
  button(:next_button, name: /contactMergePage.+nextStep/)
  a(:choose_contact_checkbox, text: 'Select All', index: 1)
  button(:merge_contact_button, name: /contactMergePage.+mergebutton/)
end
