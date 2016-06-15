class NPSPOtherDataImportPage
  include PageObject

  button(:new_button, title: 'New')
  div(:page_info, class: 'bPageTitle')
end
