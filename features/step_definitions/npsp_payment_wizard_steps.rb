Given(/^I create a new Opportunity via the API with stage name "([^"]*)" and close date "([^"]*)" and amount "([^"]*)"$/) do |stage_name, close_date, amount|
  create_opportunity_via_api("aaaaaa#{@random_string}", stage_name, close_date, amount)
end

When(/^I click Calculate Payments$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the Payment Wizard fields$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
