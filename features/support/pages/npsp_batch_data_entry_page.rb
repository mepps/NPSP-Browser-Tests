class NPSPBDEPage
  include PageObject

  text_field(:batch_name, index: 1)
  select_list(:data_type_select, name: /objectSelect/)
  text_area(:description_textarea, index:0)
  button(:new_batch_button, name: /newBatch/)
  button(:save_button, class: 'btn btnSave')
  # FIRST TEXT_FIELD ON PAGE IS IN SEARCH BOX
  select_list(:status_select, index: 1)
  text_field(:text_field_first, index: 1)
  text_field(:text_field_second, index: 2)
  text_field(:text_field_third, index: 3)
  text_field(:text_field_fourth, index: 4)
end
