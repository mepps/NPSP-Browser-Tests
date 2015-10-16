class NPSPAccountConvertPage
  include PageObject

  select_list(:account_field, name: /HHId/)
  checkbox(:all_non_npsp, id: 'check-required-fields', index: 1)
  checkbox(:all_record, id: 'check-inactiveuser')
  checkbox(:all_required, id: 'check-required-fields', index: 0)
  checkbox(:all_users, id: 'check-users-logged-out')
  checkbox(:all_workflows, id: 'check-wf-validation')
  button(:begin_conversion, id: 'conversionBTN')
  checkbox(:i_accept, id: 'check-risk')
  checkbox(:i_am_aware, id: 'check-households')
  checkbox(:ive_consulted, id: 'check-consult')
  checkbox(:my_data, id: 'check-data-backedup')
  checkbox(:the_conversion, id: 'check-sandbox-first')
end
