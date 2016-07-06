class ManageHouseholdsPage
  include PageObject
  
  button(:add_button, text: 'Add')
  div(:account_address_field, id: 'acc17_ileinner')
  h1(:account_label, class: 'pageType')
  text_field(:add_members_search, placeholder: 'Find a contact or add a new contact to the household')
  button(:add_merge_button, text: 'Add All Members')
  #span(:add_remove_button, text: /aaa/)
  #button(:add_remove_button, text: /Add.+#{@random_string}/)

  div(:outer_div, :id => 'mergeHHPopup')
    #span(:add_remove_button) { |page| page.outer_div_element.span_element.click }
    button(:add_remove_button , class: 'slds-button slds-button--icon-inverse slds-modal__close uiButton--default uiButton')

  button(:cancel_button, text: 'Cancel')

  #span(:card_name, class: 'hhCard-details-name')
  #a(:card_contact_link) { |page| page.card_name_element.link_element }

  a(:card_contact_link, text: /aaaatestcontact/)

  span(:change_address_button, text: 'Change Address')
  text_field(:change_city, id: 'hhAddressCity')
  text_field(:change_country, id: 'hhAddressCountry')
  text_field(:change_state, id: 'hhAddressState')
  textarea(:change_street, index: 0)
  text_field(:change_zip, id: 'hhAddressPostalCode')
  a(:enter_new, text: 'Enter a new address')
  div(:existing_address, class: 'slds-text-body--small slds-m-bottom--small')
  checkbox(:exclude_formal_greeting_original, class: /hh-formal-exclude-input/, index: 0)
  checkbox(:exclude_informal_greeting_original, class: /hh-informal-exclude-input/, index: 0)
  checkbox(:exclude_household_name_original, class: /hh-name-exclude-input/, index: 0)
  a(:first_household_link, text: /aaaaa/)
  button(:first_member_add_button, text: 'Add')
  text_field(:formal_greeting, id: 'hhFormalGreeting')
  button(:go_button, name: 'go')
  text_field(:hh_name, text: /Household/)
  #span(:household_address_field, class: 'hhAddress-address')
  span(:household_address_field, text: /street/)
       div(:household_details, text: 'Household Details')
  div(:household_member_first, class: 'hhCard', index: 0)
  div(:household_member_second, class: 'hhCard', index: 1)
  div(:household_member_third, class: 'hhCard', index: 2)
  div(:household_members_section, text: 'Household Members')
  div(:household_naming, class: 'slds-grid slds-grid--align-spread slds-m-around--medium')
  #button(:manage_household_save, class: 'gwPreventUI btn gwControls-save')
  button(:manage_household_save, text: 'Save')
  button(:manage_households_button, text: 'Manage Household')
  button(:new_contact, text: 'New Contact')
  h2(:page_title, class: 'pageDescription')
  text_field(:primary_contact, class: 'sfField sfField-npe01__One2OneContact__c')
  div(:regular_page_detail_block, id: 'ep')
  div(:search_part, class: 'hhSearch-item-address')
  div(:select_existing, text: 'Select an existing address')
  button(:set_address_button, text: 'Set Address')
  select_list(:view_select_list, id: 'fcf')
  div(:households_list, class: 'listBody')
end
