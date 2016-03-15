Then(/^I should see the information for my opportunity$/) do
  expect(on(FindMatchingGiftsPage).opportunity_info).to match /Total Matching Gift.+\$1,000\.00.+Matching Gift Percent.+100%.+Total Selected.+\$0\.00.+Total Unaccounted.+\$1,000\.00/m
  #expect(on(FindMatchingGiftsPage).opportunity_info).to match /Total Matching Gift.+$1,000.+Matching Gift Percent.+100%.+Total Selected.+$0.+Total Unaccounted.+$1,000/m


end

Then(/^I should see the headers for matching opportunities$/) do
  expect(on(FindMatchingGiftsPage).matching_gift_headers).to match /SELECT.+NAME.+ACCOUNT.+PRIMARY CONTACT.+AMOUNT.+CLOSE DATE/
end

Then(/^I should be able to search for matching opportunities$/) do
  on(FindMatchingGiftsPage).find_more_gifts
end
