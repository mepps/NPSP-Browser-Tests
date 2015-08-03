When(/^I retrieve existing DNO values$/) do
  on(NPSPDNOSettingsPage) do |page|
    @attribution_setting = page.attribution_setting
    #@opportunity_record_types = page.opportunity_record_types
    @opportunity_name_format = page.opportunity_name_format
    @date_format = page.date_format
  end
end

When(/^I set Attribution to "([^"]*)"$/) do |setting|
  on(NPSPDNOSettingsPage).attribution_setting = setting
end

When(/^I set Opportunity Record Types to "([^"]*)"$/) do |ort|
  on(NPSPDNOSettingsPage).opportunity_record_types = ort
end

When(/^I Opportunity Name Format to "([^"]*)"$/) do |onf|
  on(NPSPDNOSettingsPage).opportunity_name_format = onf
end

When(/^I set the date format to "([^"]*)"$/) do |date|
  on(NPSPDNOSettingsPage).date_format = date
end

Then(/^I should see the original DNO values on the page$/) do
  on(NPSPDNOSettingsPage) do |page|
    step 'I click the NPSP Settings link'
    step 'I navigate to Settings Donations Opportunity Names'
    expect(page.attribution_setting).to be == @attribution_setting
    expect(page.opportunity_name_format).to be == @opportunity_name_format
    expect(page.date_format).to be == @date_format
  end
end