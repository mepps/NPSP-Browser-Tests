class NPSPAccountModelSettingsPage
  include PageObject

  select_list(:account_model_select, name: /slAP/)
  select_list(:household_account_record_type, name: /slHHAR/)
  select_list(:one_to_one_record_type, name: /slOORT/)
end
