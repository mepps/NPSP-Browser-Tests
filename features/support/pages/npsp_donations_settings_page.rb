class NPSPDonationsSettingsPage
  include PageObject

  select_list(:contact_roles, id: /slOCRDR/)
  div(:unsaved_page_donations, text: /Opportunity Naming/)
  span(:unsaved_contact_roles, text: 'The default Contact Role automatically assigned to the Primary Contact for the Opportunity.')
  span(:saved_contact_role, text: 'Business User')
  checkbox(:opp_naming_checkbox, id: /cbxONC/)
  checkbox(:saved_opp_naming_checkbox, id: /cbxONC/, disabled: 'disabled')
end
