class EPTPage
  include PageObject

  text_field(:template_name, id: /theForm:idName/)
  button(:new_task_button, value: 'Add Task')
  button(:dependent_task_button, css: 'button.slds-button:nth-child(1)')
  button(:save_button, id: /theForm:saveCloseBTN/)
  text_field(:task_subject, id: /theForm:Name1/)
  text_field(:subtask_subject, id: /theForm:Name1-1/)
end
