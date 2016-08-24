Then(/^I should see the Manage Soft Credits page$/) do
  on(NPSPManageSoftCreditsPage) do |page|
    expect(page.body_content).to match /Primary Donor.+Total Amount.+Soft Credit Amount.+Total Unaccounted.+SOFT CREDIT RESTRICTIONS.+Amount.+Percent.+Allow Soft Credit Amount more than Total Amount/m
  end
end

When(/^I click Percent$/) do
  on(NPSPManageSoftCreditsPage).select_percent_button
end

When(/^I click Allow soft credit more than amount$/) do
  on(NPSPManageSoftCreditsPage).check_allow_check
end

When(/^I add a new soft credit for the second Contact with a Role for amount "([^"]*)"$/) do |amount|
  on(NPSPManageSoftCreditsPage) do |page|
    page.new_credit
    sleep 2
    page.contact_field_element.when_present
    page.contact_field = 'Second'
    page.role_name = 'Influencer'
    #page.select_full_button #FULL AMOUNT AUTOMATICALLY FILLS IN SOFT CREDIT REGARDLESS OF WHAT IS TYPED
    page.amount_element.send_keys amount
    page.save_button
  end
end

Then(/^I should see the new Contact Role on the Opportunity$/) do
  on(NPSPManageSoftCreditsPage) do |page|
    page.related_contact_role_list_element.when_present
    expect(page.related_contact_role_list).to match /Second.+Second Household/
  end
end