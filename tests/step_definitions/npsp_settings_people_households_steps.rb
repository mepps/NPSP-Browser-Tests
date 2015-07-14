When(/^I uncheck Automatic Household Naming$/) do
  on(NPSPHouseholdsSettingsPage).uncheck_automatic_hh_naming
end

When(/^I set Contact Overrun Count to "([^"]*)"$/) do |cont_over|
  on(NPSPHouseholdsSettingsPage).contact_overrun=cont_over
end

When(/^I set Formal Greeting Format to "([^"]*)"$/) do |f_greet|
  on(NPSPHouseholdsSettingsPage).formal_greetimg_format=f_greet
end

When(/^I set Household Mailing List Report to "([^"]*)"$/) do |mail_list|
  on(NPSPHouseholdsSettingsPage).mail_list_report=mail_list
end

When(/^I set Household Name Format to "([^"]*)"$/) do |hh_name|
  on(NPSPHouseholdsSettingsPage).hh_name_format=hh_name
end

When(/^I set Household Object Rules to "([^"]*)"$/) do |h_rule|
  on(NPSPHouseholdsSettingsPage).hh_obj_rule=h_rule
end

When(/^I set Implementing Class to "([^"]*)"$/) do |imp_class|
  on(NPSPHouseholdsSettingsPage).implementing_class=imp_class
end

When(/^I set Informal Greeting Format to "([^"]*)"$/) do |if_greet|
  on(NPSPHouseholdsSettingsPage).informal_greetimg_format=if_greet
end

When(/^I set Name Connector to "([^"]*)"$/) do |n_conn|
  on(NPSPHouseholdsSettingsPage).name_connector=n_conn
end

When(/^I set Name Overrun to "([^"]*)"$/) do |n_over|
  on(NPSPHouseholdsSettingsPage).name_overrun=n_over
end

Then(/^Automatic Household Naming should be checked$/) do
  expect(on(NPSPHouseholdsSettingsPage).automatic_hh_naming_checked?).to be true
end

Then(/^Contact Overrun Count should be "([^"]*)"$/) do |contact_overrun|
  expect(on(NPSPHouseholdsSettingsPage).contact_overrun).to match contact_overrun
end

Then(/^Examples for Household Name Format should reflect my changes$/) do
  on(NPSPHouseholdsSettingsPage) do |page|
    page.example_text_box_element.click
    page.wait_until do
      page.example_text_box.match "Sam, Sally foo Suzie"
    end
    expect(page.example_text_box).to match /Examples for Household Name Format\s+Smith \(Sam\) Household\s+Smith \(Sam foo Sally\) Household\s+Smith \(Sam, Sally foo Suzie\) Household\s+Smith \(Sam, Sally foo Suzie\) foo Doe \(Daphne\) Household\s+Smith \(Sam, Sally foo Suzie\) foo Doe \(Daphne foo Donald\) Household/m
  end
end

Then(/^Household Creation Excluded Record Types should be "([^"]*)"$/) do |hh_creation_excluded|
  #expect(on(NPSPHouseholdsSettingsPage).hh_creation_excluded_options).to be == hh_creation_excluded
  expect(on(NPSPHouseholdsSettingsPage).hh_creation_excluded_element).to be_visible
end

Then(/^Formal Greeting Format should be "([^"]*)"$/) do |formal_greeting|
  expect(on(NPSPHouseholdsSettingsPage).formal_greetimg_format).to be == formal_greeting
end

Then(/^Household Mailing List Report should be "([^"]*)"$/) do |mail_list_report|
  #expect(on(NPSPHouseholdsSettingsPage).mail_list_report).to be == mail_list_report
  expect(on(NPSPHouseholdsSettingsPage).mail_list_report_element).to be_visible
end

Then(/^Household Name Format should be "([^"]*)"$/) do |format_selected|
  expect(on(NPSPHouseholdsSettingsPage).hh_name_format).to be == format_selected
end

Then(/^Household Object Rules should be "([^"]*)"$/) do |hh_obj_rule|
  expect(on(NPSPHouseholdsSettingsPage).hh_obj_rule).to be == hh_obj_rule
end

Then(/^I should see the default Household Settings on the page$/) do
  expect(on(NPSPHouseholdsSettingsPage).page_contents).to match /{!LastName} Household.+{!{!Salutation} {!FirstName}} {!LastName}.+{!{!FirstName}}.+and.+Friends.+9.+HH_NameSpec.+No Contacts/m
end

Then(/^Implementing Class should be "([^"]*)"$/) do |imp_class|
  expect(on(NPSPHouseholdsSettingsPage).implementing_class).to be == imp_class
end

Then(/^Informal Greeting Format should be "([^"]*)"$/) do |informal_greeting|
  expect(on(NPSPHouseholdsSettingsPage).informal_greetimg_format).to be == informal_greeting
end

Then(/^Name Connector should be "([^"]*)"$/) do |name_connector|
  expect(on(NPSPHouseholdsSettingsPage).name_connector). to be == name_connector
end

Then(/^Name Overrun should be "([^"]*)"$/) do |name_overrun|
  expect(on(NPSPHouseholdsSettingsPage).name_overrun).to be == name_overrun
end
