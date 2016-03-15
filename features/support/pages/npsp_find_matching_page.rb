class FindMatchingGiftsPage
  include PageObject

  div(:opportunity_info, class: 'slds-grid slds-grid--align-spread slds-p-around--medium slds-p-bottom--large slds-theme--default')
  table(:matching_gift_headers, class: 'slds-table slds-table--bordered')
  a(:find_more_gifts, text: 'Find More Gifts')
  div(:content, class: 'slds-modal__content')
  text_field(:fifth_text_field, index: 4)
end
