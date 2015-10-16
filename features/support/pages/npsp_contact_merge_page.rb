class NPSPContactMergePage
  include PageObject

  cell(:second_contact, text: 'aaa2 [Select All]')
  a(:choose_contact_second) do |page|
    page.second_contact_element.link_element(text: /Select All/)
  end

  checkbox(:contact_checkbox_first, name: /contactMergePage.+checkedone/, index:0)
  checkbox(:contact_checkbox_second, name: /contactMergePage.+checkedone/, index:1)
  checkbox(:contact_checkbox_third, name: /contactMergePage.+checkedone/, index:2)
  text_field(:contact_search_box, id: 'contactMergePage:searchForm:searchText')
  button(:contact_search_button, id: 'contactMergePage:searchForm:searchButton')
  button(:merge_contact_button, name: /contactMergePage.+mergebutton/)
  button(:next_button, name: /contactMergePage.+nextStep/)
end
