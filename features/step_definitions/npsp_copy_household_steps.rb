Given(/^I create new Contacts with Household Object via the API$/) do
  create_contacts_with_household_object_via_api("aaahhobj#{@random_string}", "aaahhobjcontact#{@random_string}")
  @array_of_contacts << @contact_id
end

Given(/^I see Mailing City on the default Contact page$/) do
 on(NPSPCopyHouseholdPage) do |page|
   page.wait_until do
     page.mailingcity == 'hhmailingcity'
   end
 end
end

Given(/^I see Mailing City on the Household Object page$/) do
  on(NPSPCopyHouseholdPage) do |page|
    page.wait_until do
      page.mailingcity == 'hhmailingcity'
    end
  end
end

Given(/^I do not see Mailing City on the other Contact page$/) do
  step 'I navigate to first Contact created'
  on(NPSPCopyHouseholdPage) do |page|
    page.wait_until do
      page.mailingcity == ''
    end
  end
end

When(/^I click Copy Household Address To Contacts on the Household Object Page$/) do
  step 'I navigate to Household created'
  on(NPSPCopyHouseholdPage).copy_addresses_button_element.when_present.click
end

Then(/^I should see Mailing City on the other Contact page$/) do
  sleep 5 #WAIT FOR CHANGE OF ADDRESS TO PROPAGATE
  step 'I navigate to first Contact created'
  expect(on(NPSPCopyHouseholdPage).mailingcity).to eq 'hhmailingcity'
end