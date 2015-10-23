Given(/^I create new Contacts with Household Object via the API$/) do
  create_contacts_with_household_object_via_api("aaahhobj#{@random_string}", "aaahhobjcontact#{@random_string}")
  @array_of_contacts << @contact_id
end