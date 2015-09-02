When(/^I click the NPSP Settings link$/) do
  on(NPSPMainPage).npsp_settings_link_element.when_present.click
end

When(/^I click the Recurring Donations link$/) do
  on(NPSPMainPage).recurring_donations_link_element.when_present.click
end

Then(/^I should be able to click the New button$/) do
  expect(on(NPSPMainPage).new_recurring_donations_button_element.when_present).to be_visible
end

Then(/^I should see the NPSP Application Settings page$/) do
  expect(on(NPSPMainPage).npsp_home_page_text).to match 'Nonprofit Starter Pack Application Settings'
end

Then(/^I should see the Recurring Donations home page$/) do
  on(NPSPMainPage) do |page|
    expect(page.home_page_text).to match 'Recurring Donations'
    expect(page.home_page_text).to match 'Home'
  end
end
