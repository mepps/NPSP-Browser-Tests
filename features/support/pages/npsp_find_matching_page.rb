class FindMatchingGiftsPage
  include PageObject

  button(:cancel_button, text: 'Cancel')
  div(:content, class: 'slds-modal__content')
  table(:error_message, class: 'messageTable')
  text_field(:fifth_text_field, index: 4)
  a(:find_more_gifts, text: 'Find More Gifts')
  table(:matching_gift_headers, class: 'slds-table slds-table--bordered')
  div(:opportunity_info, class: 'slds-grid slds-grid--align-spread slds-p-around--medium slds-p-bottom--large slds-theme--default')
  button(:search_button, text: 'Search')
end
