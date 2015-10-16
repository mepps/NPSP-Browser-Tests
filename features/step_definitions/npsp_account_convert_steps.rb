Given(/^the Begin button is disabled$/) do
  on(NPSPAccountConvertPage) do |page|
    page.wait_until do
      page.begin_conversion_element.disabled? == true
    end
  end
end

Given(/^the Account Field is visible$/) do
  on(NPSPAccountConvertPage) do |page|
    page.wait_until do
      page.account_field_element.visible? == true
    end
  end
end

When(/^I check all the boxes$/) do
  on(NPSPAccountConvertPage) do |page|
    page.check_all_users
    page.check_my_data
    page.check_the_conversion
    page.check_all_record
    page.check_all_workflows
    page.check_all_required
    page.check_i_am_aware
    page.check_all_non_npsp
    page.check_ive_consulted
    page.check_i_accept
  end
end

Then(/^the Begin button is not disabled$/) do
  expect(on(NPSPAccountConvertPage).begin_conversion_element.disabled?).to be false
end