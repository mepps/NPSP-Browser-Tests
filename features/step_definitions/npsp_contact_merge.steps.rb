Given(/^I create three Contacts "([^"]*)" and "([^"]*)" and "([^"]*)"$/) do |con1, con2, con3|
  create_contact_via_api(con1)
  @array_of_contacts << @contact_id
  create_contact_via_api(con2)
  @array_of_contacts << @contact_id
  create_contact_via_api(con3)
  @array_of_contacts << @contact_id
end

Given(/^I do a Contact Merge search for "([^"]*)"$/) do |search_term|
  on(NPSPContactMergePage).contact_search_box_element.when_present.send_keys search_term
end

When(/^I select "([^"]*)" as the winning Contact$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I merge the contacts$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see "([^"]*)" in All Contacts$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should not see "([^"]*)" or "([^"]*)" in All Contacts$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end