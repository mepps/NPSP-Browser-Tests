class NPSPHouseholdsSettingsPage
  include PageObject

  checkbox(:automatic_hh_naming, id: /pbHH:cbxAHN/)
  div(:example_text_box, class: 'sectionExamples')
  select(:formal_greetimg_format, name: /pbHH:slstrFormatFG/)
  select(:hh_creation_excluded, name: /idDBMS/)
  select(:hh_name_format, name: /pbHH:slstrFormatHH/)
  select(:hh_obj_rule, name: /pbHH:slHR/)
  div(:hh_page_contents, id: /idPanelHH/)
  text_field(:implementing_class, name: /pbHH:txtClass/)
  select(:informal_greetimg_format, name: /pbHH:slstrFormatIG/)
  select(:mail_list_report, name: /pbHH:slHMLI/)
  text_field(:name_connector, name: /pbHH:txtAnd/)
  text_field(:name_overrun, name: /pbHH:txtOverrun/)
  div(:page_contents, class: /content/)
  text_field(:contact_overrun, name: /pbHH:txtOverrunCount/)
end