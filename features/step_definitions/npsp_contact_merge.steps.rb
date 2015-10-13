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
    page.choose_contact_second
  end
end

When(/^I merge the contacts$/) do
  on(NPSPContactMergePage).merge_contact_button
  step 'I navigate to Contacts'

  on(NPSPContactsPage) do |page|
    page.all_contacts = 'All Contacts'
    page.go_button
    page.wait_until do
      page.contacts_display_element.visible?
    end
  end
end

Then(/^I should see "([^"]*)" in All Contacts$/) do |merged_contact|
  expect(on(NPSPContactsPage).contacts_display).to match merged_contact
end

Then(/^I should not see "([^"]*)" or "([^"]*)" in All Contacts$/) do |deleted1, deleted2|
  on(NPSPContactsPage) do |page|
    expect(page.contacts_display).not_to match deleted1
    expect(page.contacts_display).not_to match deleted2
  end
end
