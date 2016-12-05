Before do |scenario|
  @array_of_contacts = []
  @array_of_contact_names = []
  @array_of_gaus = []
  @array_of_opp_ids = []
  @gau_names = []
  set_url_and_object_namespace_to_npsp
end

After('@reset_recurring_donations') do
  reset_recurring_donations_settings(@recurring_donations_settings)
end

After('@reset_aff_relationships') do
  reset_relationships_settings(@relationships_aff_settings)
end

After('@reset_relationships') do
  reset_relationships_settings(@relationships_settings)
end

After('@reset_account_model') do
  reset_account_model_settings(@account_model_settings)
end

After do |scenario|
  #CLOBBER OBJECTS TO PREVENT FAILURES FROM POLLUTING DOWNSTREAM TESTS
  #IF THE OBJECT IS ALREADY DELETED THIS IS A NOOP
  update_account_model('Household Account')
  delete_contacts_via_api
  delete_leads
  delete_payments
  delete_opportunities
  delete_recurring_donations
  delete_household_accounts
  delete_non_household_accounts
  delete_household_objects
  delete_gaus_via_api
  delete_engagement_plan_templates
end
