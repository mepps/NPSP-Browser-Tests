Given(/^I navigate to Batch Data Entry page$/) do
  @browser.goto($target_org_url + '/apex/BDE_BatchEntry')
end

Given(/^I navigate to Contacts$/) do
  on(NPSPMainPage).contacts_tab_on_page_element.when_present.click
end

Given(/^I navigate to Contact Merge$/) do
  @browser.goto($target_org_url + '/apex/CON_ContactMerge')
end

Given(/^I navigate to first Contact created$/) do
  @browser.goto($instance_url + '/' + @array_of_contacts[0])
end

When(/^I navigate to Getting Started/) do
  @browser.goto($target_org_url + '/apex/NPSP_Resources')
end

Given(/^I navigate to Household created$/) do
  @browser.goto($instance_url + '/' + @hh_obj_id)
end

Given(/^I navigate to Manage Households UI$/) do
  @browser.goto($target_org_url + '/apex/HH_ManageHHAccount?scontrolCaching=1&id=' + @account_id)
end

Given(/^I navigate to Manage Households UI for contact$/) do
  @browser.goto($target_org_url + '/apex/HH_ManageHHAccount?scontrolCaching=1&id=' + @account_id_for_contact)
end

Given(/^I navigate to Manage Households UI for Household Object$/) do
  @browser.goto($target_org_url + '/apex/HH_ManageHousehold?scontrolCaching=1&id=' + @hh_obj_id)
end

Given(/^I navigate to Matching Donation for that Opportunity$/) do
  @browser.goto($target_org_url + '/apex/OPP_MatchingDonationsBTN?id=' + @opportunity_id)
end

Given(/^I navigate to Opportunity$/) do
  on(NPSPMainPage).opportunities_link_element.when_present(15).click
end

Given(/^I navigate to Payment Wizard for that Opportunity$/) do
  @browser.goto($target_org_url + '/apex/PMT_PaymentWizard?id=' + @opportunity_id + '&wtype=payment')
end

Given(/^I navigate to Payments$/) do
  on(NPSPMainPage).payments_link_element.when_present(15).click
end

Given(/^I navigate to Recurring Donations$/) do
  on(NPSPMainPage).recurring_donations_link_element.when_present(15).click
end

Given(/^I navigate to Relationship Viewer for the Primary Contact$/) do
  @browser.goto($target_org_url + '/apex/REL_RelationshipsViewer?id=' + @array_of_contacts[0])
end

Given(/^I navigate to the Account Conversions page$/) do
  @browser.goto($target_org_url + '/apex/npsp__CONV_Account_Conversion')
end

Given(/^I navigate to Settings Donations Opportunity Names$/) do
  on(NPSPSettingsPage) do |page|
    page.donations_element.when_present(10).click
    page.opportunity_names_element.when_present.click
    page.edit_opp_button_element.when_present.click
    step 'I wait for the page to revert'
  end
end

Given(/^I navigate to Settings People Account Model$/) do
  on(NPSPSettingsPage) do |page|
    page.people_element.when_present(10).click
    page.account_model_element.when_present.click
    page.edit_am_button_element.when_present.click
    step 'I wait for the page to revert'
  end
end

Given(/^I navigate to Settings People Addresses$/) do
  on(NPSPSettingsPage) do |page|
    page.people_element.when_present(10).click
    page.addresses_element.when_present.click
    page.edit_button_element.when_present.click
    step 'I wait for the page to revert'
  end
end

Given(/^I navigate to Settings People Households$/) do
  on(NPSPSettingsPage) do |page|
    page.people_element.when_present(10).click
    page.households_element.when_present.click
    page.edit_hh_button_element.when_present.click
    step 'I wait for the page to revert'
  end
end

Given(/^I login the first time with oauth$/) do
  on(LoginPage) do |page|
    page.app_switcher_element.when_present.click
    begin
      #WE ONLY NEED TO CLICK NPSP AFTER A FRESH INSTALL
      #DON'T FAIL THE TEST IF NPSP IS ALREADY SELECTED
      page.npsp_app_picker_element.when_present.click
    rescue
    end
    page.app_switcher_element.when_present.click
  end
end

When(/^I navigate to All Accounts$/) do
  step 'I click the Accounts tab'
  step 'I select "All Accounts" and Go'
end

When(/^I navigate to Copy Address page for the Contact$/) do
  @browser.goto($target_org_url + '/apex/npsp__ADDR_CopyAddrHHObjBTN?id=' + @contact_id)
end

When(/^I navigate to Lead Convert page for the Lead$/) do
  @browser.goto($target_org_url + '/apex/LD_LeadConvertOverride?id=' + @lead_id)
end

When(/^I navigate to New Contact Donation Page$/) do
  @browser.goto($target_org_url + '	/setup/ui/recordtypeselect.jsp?ent=Opportunity&retURL=%2F' + @contact_id + '&save_new_url=%2F006%2Fe%3Flookupcmpgn%3D1%26retURL%3D%252F' + @contact_id + '%26accid%3D' + @account_id_for_contact + '%26conid%3D' + @contact_id + '&opp3=' + @contact_name + '-%20Donation%20{!Today}')
end

When(/^I navigate to NPSP Data Import/) do
  @browser.goto($target_org_url + '/apex/BDI_DataImport')
end

When(/^I navigate to the Manage Allocations page$/) do
  @browser.goto($target_org_url + '/apex/ALLO_ManageAllocations?id=' +@opportunity_id)
end
