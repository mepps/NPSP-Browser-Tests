Given(/^I create three Contacts "([^"]*)" and "([^"]*)" and "([^"]*)"$/) do |con1, con2, con3|
  create_contact_via_api(con1)
  @array_of_contacts << @contact_id
  create_contact_via_api(con2)
  @array_of_contacts << @contact_id
  create_contact_via_api(con3)
  @array_of_contacts << @contact_id
end

Given(/^I do a Contact Merge search for "([^"]*)"$/) do |search_term|
  on(NPSPContactMergePage) do |page|
    page.contact_search_box_element.when_present.send_keys search_term
    page.contact_search_button
  end
end

When(/^I select the second Contact as the winning Contact$/) do
  on(NPSPContactMergePage) do |page|
    page.wait_until do
      page.contact_checkbox_first_element.visible?
    end
    page.check_contact_checkbox_first
    page.check_contact_checkbox_second
    page.check_contact_checkbox_third
    page.next_button
    page.choose_contact_checkbox
  end
end

When(/^I merge the contacts$/) do
  on(NPSPContactMergePage).merge_contact_button
end

Then(/^I should see "([^"]*)" in All Contacts$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should not see "([^"]*)" or "([^"]*)" in All Contacts$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end