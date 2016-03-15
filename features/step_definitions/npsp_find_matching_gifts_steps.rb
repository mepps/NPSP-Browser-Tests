Then(/^I should be able to search for matching opportunities$/) do
  on(FindMatchingGiftsPage) do |page|
    page.find_more_gifts
    expect(page.fifth_text_field_element.when_present).to be_visible
    expect(page.content).to match /Account.+Primary Contact.+Amount.+Close Date Start.+Close Date End/m
  end
end

Then(/^I should see a Cancel button$/) do
  expect(on(FindMatchingGiftsPage).cancel_button_element).to be_visible
end

Then(/^I should see the headers for matching opportunities$/) do
  expect(on(FindMatchingGiftsPage).matching_gift_headers).to match /SELECT.+NAME.+ACCOUNT.+PRIMARY CONTACT.+AMOUNT.+CLOSE DATE/
end

Then(/^I should see the information for my opportunity$/) do
  expect(on(FindMatchingGiftsPage).opportunity_info).to match /Total Matching Gift.+\$1,000\.00.+Matching Gift Percent.+100%.+Total Selected.+\$0\.00.+Total Unaccounted.+\$1,000\.00/m
end

Then(/^when I click Search I should see an error "([^"]*)" and "([^"]*)"$/) do |warning, content|
  on(FindMatchingGiftsPage) do |page|
    page.search_button
    page.wait_until do
      page.error_message_element.visible? == true
    end
    expect(page.error_message).to match /#{warning}.+#{content}/m
  end
end
