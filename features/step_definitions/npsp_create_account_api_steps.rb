Given(/^I create a new random account via the API$/) do
  create_account_via_api("aaaacreacc1#{@random_string}")
end

Given(/^I delete the random account via the API$/) do
  create_account_via_api("aaaacreacc2#{@random_string}")
  delete_account_via_api
end

Then(/^I should not see the random account created earlier$/) do
  expect(on(NPSPAllAccountsPage).first_account_record).not_to match @random_string
end

Then(/^I should see the new account is a Household account$/) do
  on(NPSPAllAccountsPage) do |page|
    page.wait_until do
      page.first_account_record.match @random_string
    end
  expect(page.first_account_record).to match @random_string
  expect(page.first_account_record).to match "Household"
  end
end
