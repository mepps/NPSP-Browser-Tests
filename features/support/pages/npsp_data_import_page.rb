class NPSPDataImportPage
  include PageObject

  text_field(:batch_size, name: /idForm:tbxBS/)
  select_list(:contact_matching, name: /idForm:slCMR/)
  select_list(:contact_custom, name: /idForm:slCCUI/)
  select_list(:account_custom, name: /idForm:slACUI/)
  button(:begin_button , class: 'btn btn btn-md btn-success')
  div(:page_contents, class: 'bootstrap')
end
