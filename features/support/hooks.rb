Before do |scenario|
  @array_of_contacts = []
  @array_of_contact_names = []
  @array_of_gaus = []
  @array_of_opp_ids = []
  @gau_names = []
  set_url_and_object_namespace_to_npsp
end

After do |scenario|
  #CLOBBER OBJECTS TO PREVENT FAILURES FROM POLLUTING DOWNSTREAM TESTS
  #IF THE OBJECT IS ALREADY DELETED THIS IS A NOOP
  update_account_model('Household Account')
  #delete_contacts_via_api
  delete_leads
  delete_payments
  #delete_opportunities
  delete_recurring_donations
  #delete_household_accounts
  delete_non_household_accounts
  delete_household_objects
  #delete_gaus_via_api
end
