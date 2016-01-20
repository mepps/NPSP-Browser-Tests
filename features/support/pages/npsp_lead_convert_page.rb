class NPSPLeadConvertPage
  include PageObject

  button(:cancel_button, value: 'Cancel')
  select_list(:contact_select, name: /pbEdit.+conlist/)
  button(:convert_button, value: 'Convert')
  select_list(:converted_status, name: /pbEdit/, index: 2)
  checkbox(:do_not_create_opp, name: /pbEdit/, index: 1)
  checkbox(:email_to_owner_checkbox, name: /pbEdit/, index: 0)
  select_list(:opportunity_account, name: /pbEdit/, index: 1)
  text_field(:opportunity_name, name: /pbEdit/, index: 1)

end
