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

Then(/^the Save button should be clickable$/) do
  expect(on(NPSPBDEPage).save_button_element.disabled?).to be false
end
