
When(/^I click the BDE Save button$/) do
  on(NPSPBDEPage).save_button
end

When(/^I click the pin buttons for Last Name and for Company$/) do
  on(NPSPBDEPage) do |page|
    #sleep 1
    page.company_pin_button_element.when_present.click
    page.last_name_pin_button_element.when_present.click
  end
end

When(/^I enter "([^"]*)" for Company value$/) do |company|
  on(NPSPBDEPage).company = company + @random_string
end

When(/^I enter "([^"]*)" for Last Name value$/) do |last_name|
  on(NPSPBDEPage).last_name = last_name + @random_string
end

When(/^I select New Batch for "([^"]*)"$/) do |data_type|
  on(NPSPBDEPage) do |page|
    page.data_type_select=data_type
    page.new_batch_button
  end
end

Then(/^Batch Name should contain "([^"]*)"$/) do |batch_type|
  expect(on(NPSPBDEPage).batch_name).to match batch_type
end

Then(/^Batch Status should be "([^"]*)"$/) do |batch_status|
  expect(on(NPSPBDEPage).status_select).to eq batch_status
end

Then(/^I should see a Description textarea$/) do
  expect(on(NPSPBDEPage).description_textarea_element).to be_visible
end

Then(/^I should see four text fields$/) do
  on(NPSPBDEPage) do |page|
    expect(page.text_field_first_element).to be_visible
    expect(page.text_field_second_element).to be_visible
    expect(page.text_field_third_element).to be_visible
    expect(page.text_field_fourth_element).to be_visible
  end
end

Then(/^the Company field should contain "([^"]*)"$/) do |company|
  expect(on(NPSPBDEPage).company).to eq company + @random_string
end

Then(/^the Last Name field should contain "([^"]*)"$/) do |last_name|
  expect(on(NPSPBDEPage).last_name).to eq last_name + @random_string
end

Then(/^the Save button should be clickable$/) do
  expect(on(NPSPBDEPage).save_button_element.disabled?).to be false
end

Then(/^the Saved Record list should show the saved record$/) do
  on(NPSPBDEPage) do |page|
    expect(page.saved_record_list_element.when_present).to be_visible
    expect(page.record_table). to match /Lastname#{@random_string}.+Company#{@random_string}/
  end
end
