Given(/^I create a new Lead via the API$/) do
  create_lead_via_api(@random_string, @random_string)
end

Then(/^I should see the Lead Convert page for the Lead$/) do
  on(NPSPLeadConvertPage) do |page|
    expect(page.email_to_owner_checkbox_element).to be_visible
    expect(page.contact_select).to eq "Create New: #{@random_string}"
    expect(page.opportunity_name).to eq @random_string
    expect(page.do_not_create_opp_checked?).to be true
    expect(page.opportunity_account).to eq 'Contact Account'
    expect(page.converted_status).to eq 'Closed - Converted'
    expect(page.convert_button_element).to be_visible
    expect(page.cancel_button_element).to be_visible
  end
end
