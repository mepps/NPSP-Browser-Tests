class ManageHouseholdsPage
  include PageObject

  span(:card_name, class: 'hhCard-details-name')
    a(:card_contact_link) { |page| page.card_name_element.link_element }
  span(:existing_address, class: 'hhCard-details-address')
  text_field(:hh_name, id: 'hhName')
  text_field(:formal_greeting, id: 'hhFormalGreeting')
  text_field(:primary_contact, class: 'sfField sfField-npe01__One2OneContact__c')
  button(:manage_household_save, class: 'gwPreventUI btn gwControls-save')


  text_field(:add_members_search, id: 'hhSearch-input')
  button(:add_button, text: 'Add')
  button(:add_merge_button, text: 'Add and merge Households')
  button(:add_remove_button, text: 'Add and remove from old Household')
  button(:cancel_button, text: 'Cancel')
  button(:change_address_button, text: 'Change')
  text_field(:change_city, id: 'hhAddressCity')
  text_field(:change_country, id: 'hhAddressCountry')
  text_field(:change_state, id: 'hhAddressState')
  textarea(:change_street, id: 'hhAddressStreet')
  text_field(:change_zip, id: 'hhAddressPostalCode')
  a(:enter_new, text: 'Enter a new address')
  checkbox(:exclude_formal_greeting_original, class: /hh-formal-exclude-input/, index: 0)
  checkbox(:exclude_informal_greeting_original, class: /hh-informal-exclude-input/, index: 0)
  checkbox(:exclude_household_name_original, class: /hh-name-exclude-input/, index: 0)
  a(:first_household_link, text: /aaaaa/)
  button(:first_member_add_button, text: 'Add')
  button(:go_button, name: 'go')
  span(:household_address_field, class: 'hhAddress-address')
  h2(:household_details, text: 'Household Details')
  div(:household_member_first, class: 'hhCard', index: 0)
  div(:household_member_second, class: 'hhCard', index: 1)
  div(:household_member_third, class: 'hhCard', index: 2)
  h2(:household_members_section, text: 'Household Members')
  div(:household_naming, id: 'hhNaming')
  button(:manage_households_button, text: 'Manage Household')
  text_field(:member_search_box, id: 'hhSearch-input')
  button(:new_contact, text: 'New Contact')
  div(:regular_page_detail_block, id: 'ep')
  div(:search_part, class: 'hhSearch-item-address')
  a(:select_existing, text: 'Select an existing address')
  button(:set_address_button, text: 'Set Address')
  select_list(:view_select_list, id: 'fcf')
  div(:households_list, class: 'listBody')
end
