class NPSPRelationshipsSettingsPage
  include PageObject

  select_list(:reciprocal_method_select, id: /lRM/)
  span(:page_reciprocal_method, text: 'Value Inversion')
  span(:unsaved_page_reciprocal_method, text: 'List Setting')
  div(:unsaved_page_affiliations, text: /Automatic Affiliation Management/)
end
