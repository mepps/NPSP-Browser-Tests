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

Then(/^Examples for Household Name Format should reflect my changes$/) do
  on(NPSPHouseholdsSettingsPage) do |page|
    page.example_text_box_element.click
    page.wait_until do
      page.example_text_box.match "Sam, Sally foo Suzie"
    end
    expect(page.example_text_box).to match /Examples for Household Name Format\s+Smith \(Sam\) Household\s+Smith \(Sam foo Sally\) Household\s+Smith \(Sam, Sally foo Suzie\) Household\s+Smith \(Sam, Sally foo Suzie\) foo Doe \(Daphne\) Household\s+Smith \(Sam, Sally foo Suzie\) foo Doe \(Daphne foo Donald\) Household/m
  end
end

Then(/^I should see the original Household Settings on the page$/) do
  on(NPSPSettingsPage).edit_hh_button_element.when_present.click
  step 'I wait for the page to revert'
  on(NPSPHouseholdsSettingsPage) do |page|
    page.wait_until do
      page.contact_overrun_element.visible? == true
    end
    expect(page.automatic_hh_naming_checked?).to be == @automatic_hh_naming_checked
    expect(page.contact_overrun).to be == @contact_overrun
    expect(page.hh_creation_excluded).to be == @hh_creation_excluded
    expect(page.formal_greetimg_format).to be == @formal_greetimg_format
    expect(page.mail_list_report).to be == @mail_list_report
    expect(page.hh_name_format).to be == @hh_name_format
    expect(page.hh_obj_rule).to be == @hh_obj_rule
    expect(page.implementing_class).to be == @implementing_class
    expect(page.informal_greetimg_format).to be == @informal_greetimg_format
    expect(page.name_connector).to be == @name_connector
    expect(page.name_overrun).to be == @name_overrun
  end
end

When(/^I retrieve existing values/) do
  on (NPSPHouseholdsSettingsPage) do |page|
    @automatic_hh_naming_checked = page.automatic_hh_naming_checked?
    @contact_overrun = page.contact_overrun
    @hh_creation_excluded = page.hh_creation_excluded
    @formal_greetimg_format = page.formal_greetimg_format
    @mail_list_report = page.mail_list_report
    @hh_name_format = page.hh_name_format
    @hh_obj_rule = page.hh_obj_rule
    @implementing_class = page.implementing_class
    @informal_greetimg_format = page.informal_greetimg_format
    @name_connector = page.name_connector
    @name_overrun = page.name_overrun
  end
end
