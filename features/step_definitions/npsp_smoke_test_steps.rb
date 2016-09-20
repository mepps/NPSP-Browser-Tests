When(/^I click the Recurring Donations link$/) do
  on(NPSPMainPage).recurring_donations_link_element.when_present.click
end

Then(/^I should be able to click the New button$/) do
  expect(on(NPSPMainPage).new_recurring_donations_button_element.when_present).to be_visible
end

Then(/^I should see the NPSP Application Settings page$/) do
  on(NPSPMainPage) do |page|
    page.npsp_home_page_text_element.when_present(10)
    expect(page.npsp_home_page_text).to match 'Nonprofit Success Pack Application Settings'
  end
end

Then(/^I should see the Recurring Donations home page$/) do
  on(NPSPMainPage) do |page|
    page.wait_until(15) do
      page.home_page_text_element.visible? == true
    end
    expect(page.home_page_text).to match 'Recurring Donations'
    expect(page.home_page_text).to match 'Home'
  end
end
