class NPSPRelationshipsSettingsPage
  include PageObject

  select_list(:gender_field_select, id: /lGF/)
  span(:page_gender, text: 'Level')
end
