class NPSPManageSoftCreditsPage
  include PageObject

  div(:body_content, class: 'myBodyContent')
  radio_button(:percent_button, index: 1)
  checkbox(:allow_check, id: /allowTooManySoftCredits/)
  a(:new_credit, text: 'Add another soft credit')
  text_field(:contact_field, class: 'lookupInput')
  select_list(:role_name, class: 'slds-select')
  radio_button(:full_button, index: 2)
  text_field(:amount, class: 'slds-input')
  button(:save_button, value: 'Save')
end
