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

Then(/^I should see "([^"]*)" monthly donations for "([^"]*)"$/) do |number, amount|
  on(NPSPRecurringDonationsPage) do |page|
    expect(page.donations_section). to match /#{@random_string} Donation \(1 of 12\).+#{@random_string} Household.+Pledged /
    expect(page.donations_section). to match Regexp.escape(amount)
  end
end

When(/^I delete two of the payments$/) do
  on(NPSPRecurringDonationsPage) do |page|
    page.delete_link
    sleep 1
    @browser.alert.ok
    page.delete_link
    sleep 1
    @browser.alert.ok
  end
end

When(/^I click Refresh Opportuniites$/) do
  on(NPSPRecurringDonationsPage).refresh_button
end