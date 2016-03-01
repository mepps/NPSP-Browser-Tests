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
    page.contact_checkbox_first_element.when_present.click
    page.contact_checkbox_second_element.when_present.click
    page.contact_checkbox_third_element.when_present.click
    page.next_button_element.when_present.click
    page.choose_contact_second_element.when_present.click
  end
end

When(/^I merge the contacts$/) do
  on(NPSPContactMergePage) do |page|
    page.merge_contact_button_element.when_present(10).click
    page.modal_merge_button_element.when_present.click
  end

  step 'I navigate to Contacts'

  on(NPSPContactsPage) do |page|
    page.wait_until do
      page.all_contacts_element.visible? == true
    end
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
