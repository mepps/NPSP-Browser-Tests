When(/^I create a new Opportunity with name "([^"]*)" and close date today and amount "([^"]*)" and stage "([^"]*)"$/) do |name, amount, stage|
  on(NPSPOpportunitiesPage) do |page|
    page.new_button
    page.today_link
    page.opp_name = name
    page.opp_amount = amount
    page.opp_stage = "Closed Won"
    page.save_button
  end
end

When(/^I navigate from Opportunity to the Payment$/) do
  @browser.goto($instance_url + '/home/showAllTabs.jsp')
  step 'I navigate to Payments'
  on(NPSPOpportunitiesPage).go_button
  on(NPSPOpportunitiesPage).payment_edit_link
end

Then(/^the payment edit amount should be "([^"]*)"$/) do |amount|
  expect(on(NPSPOpportunitiesPage).payment_amount).to eq amount
end