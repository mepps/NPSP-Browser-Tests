Then(/^I should see the Getting Started text$/) do
  on(NPSPGettingStartedPage) do |page|
    expect(page.page_contents).to match 'Welcome to Salesforce and the Nonprofit Starter Pack!'
    expect(page.left_side_contents).to match /Get Started.+Review Salesforce Fundamentals.+Get Started with the Nonprofit Starter Pack.+Nonprofit Starter Pack \(NPSP\) Workbook.+NPSP Admin Guide to Importing Donor Data/m
    expect(page.right_side_contents).to match /Get Help.+Power of Us Hub Community.+Salesforce Success Plan.+Salesforce\.org Office Hours/m
  end
end

Then(/^I should see the Getting Started links$/) do
  on(NPSPGettingStartedPage) do |page|
    expect(page.salesforce_fundamentals_link_element).to be_visible
    expect(page.beginner_admin_trail_link_element).to be_visible
    expect(page.this_interactive_learning_path_link_element).to be_visible
    expect(page.this_workbook_link_element).to be_visible
    expect(page.guide_link_element).to be_visible
    expect(page.power_of_us_login_link_element).to be_visible
    expect(page.salesforce_success_learn_more_link_element).to be_visible
    expect(page.foundation_office_hours_learn_more_link_element).to be_visible
  end
end
