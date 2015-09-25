Given(/^I create a new Contact via the API with$/) do
  create_contact_via_api("aaaaaa#{@random_string}")
  @array_of_contacts << @contact_id
end

When(/^I navigate to Relationship Viewer for that Opportunity$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the relationship in Relationship Viewer$/) do
  pending # Write code here that turns the phrase above into concrete actions
end