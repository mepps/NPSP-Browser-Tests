Then(/^I should see the New Opportunity page$/) do
  expect(on(NPSPNewContactDonationPage).page_header).to match /Opportunity Edit.+New Opportunity/m
end

Then(/^Opportunity Name should be set to the correct value$/) do
  expect(on(NPSPNewContactDonationPage).opp_name).to eq @contact_name + '- Donation {!Today}'
end

Then(/^Account Name should be set to the correct value$/) do
  expect(on(NPSPNewContactDonationPage).acc_name).to eq @contact_name + ' Household'
end
