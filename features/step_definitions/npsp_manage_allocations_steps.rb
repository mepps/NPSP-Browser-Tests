Given(/^I create a GAU named "([^"]*)"$/) do |gau_name|
  create_gau_via_api(gau_name)
  @array_of_gaus << @gau_id
end

When(/^I add a row$/) do
  on(NPSPManageAllocationsPage) do |page|
    page.add_row_button_element.when_present.click
    page.wait_until do
      page.second_row_percent_element.visible? == true
    end
  end
end

When(/^I enter "([^"]*)" in the Amount for the first row for the first GAU$/) do |amount|
  on(NPSPManageAllocationsPage).first_row_amount = amount
end

When(/^I enter "([^"]*)" in the Percent for the second row for the second GAU$/) do |percent|
  on(NPSPManageAllocationsPage).second_row_percent = percent
end

Then(/^Delete Row should be present$/) do
  expect(on(NPSPManageAllocationsPage).delete_row_button_element).to be_visible
end

Then(/^Percent in the first row should be disabled$/) do
  expect(on(NPSPManageAllocationsPage).first_row_percent_element.disabled?).to be true
end

Then(/^Amount in the second row should be disabled$/) do
  expect(on(NPSPManageAllocationsPage).second_row_amount_element.disabled?).to be true
end

Then(/^Save and Close should be present$/) do
  expect(on(NPSPManageAllocationsPage).save_and_close_button_element).to be_visible
end

