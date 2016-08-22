Then(/^I should see the Manage Soft Credits page$/) do
  on(NPSPManageSoftCreditsPage) do |page|
    expect(page.body_content).to match /Primary Donor.+Total Amount.+Soft Credit Amount.+Total Unaccounted.+SOFT CREDIT RESTRICTIONS.+Amount.+Percent.+Allow Soft Credit Amount more than Total Amount/m
  end
end

When(/^I click Percent$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click Allow soft credit more than amount$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I add a new soft credit for the second Contact with a Role for amount "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the new soft credit$/) do
  pending # Write code here that turns the phrase above into concrete actions
end