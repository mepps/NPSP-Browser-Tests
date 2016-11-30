class NPSPRelationshipsSettingsPage
  include PageObject

  select_list(:reciprocal_method_select, id: /lRM/)
  span(:page_reciprocal_method, text: 'Value Inversion')
end
