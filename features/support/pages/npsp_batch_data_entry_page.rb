class NPSPBDEPage
  include PageObject

  text_field(:batch_name, index: 1)
  select_list(:data_type_select, name: /objectSelect/)
  text_area(:description_textarea, index:0)
  button(:new_batch_button, name: /newBatch/)
  button(:save_button, class: 'btn btnSave')
  text_field(:last_name, class: 'sticky-LastName')
  text_field(:company, class: 'sticky-Company')
  span(:company_pin_button, class: 'ui-button-text', text: 'Toggle', index: 1)
  span(:last_name_pin_button, class: 'ui-button-text', text: 'Toggle', index: 3)
  h3(:saved_record_list, text: 'Saved Record List (1 records)')
  table(:record_table, class: 'detailList', index: 2)
  # FIRST TEXT_FIELD ON PAGE IS IN SEARCH BOX
  select_list(:status_select, index: 1)
  text_field(:text_field_first, index: 1)
  text_field(:text_field_second, index: 2)
  text_field(:text_field_third, index: 3)
  text_field(:text_field_fourth, index: 4)
end
