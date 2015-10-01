When(/^I create a "([^"]*)" recurring donation for "([^"]*)" months for "([^"]*)"$/) do |period, number, amount|
  create_contact_via_api(@random_string)
  on(NPSPRecurringDonationsPage) do |page|
    page.new_button_element.when_present.click
    page.donation_name_element.when_present.send_keys @random_string
    page.period_select = period
    page.installments_field = number
    page.amount = amount
    page.contact_field = @random_string
    page.save_button

  end
end

Then(/^I should see "([^"]*)" monthly donations for "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I create a "([^"]*)" "([^"]*)" recurring donation for "([^"]*)" months for "([^"]*)"$/) do |arg1, arg2, arg3, arg4|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I delete two of the payments$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I edit the Stage for a payment to be "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see a new page for for the Recurring Donation$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the deleted payments should be restored$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the Stage for all payments should be "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end