class NPSPManageAllocationsPage
  include PageObject

  button(:add_row_button, name: /addRowBTN/)
  button(:delete_row_button, name: /delRowBTN/)
  button(:save_and_close_button, name: /saveCloseBTN/)
  text_field(:first_gau_field, name: /theForm/, index: 0)
  text_field(:first_row_amount, name: /theForm/, index: 1)
  text_field(:first_row_percent, name: /theForm/, index: 2)
  text_field(:second_gau_field, name: /theForm/, index: 3)
  text_field(:second_row_amount, name: /theForm/, index: 4)
  text_field(:second_row_percent, name: /theForm/, index: 5)
  text_field(:error_box, name: /theForm:messages/)
  div(:remainder_amount, id: 'totalAmount')
end
