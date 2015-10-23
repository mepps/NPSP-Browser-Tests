Given(/^I create a new Contact with Household Object via the API$/) do
  create_contact_with_household_object_via_api("hhobj#{@random_string}", "hhobjcontact#{@random_string}")
  @array_of_contacts << @contact_id
end