Given(/^I login with environment variables$/) do
  visit(LoginPage).login_with_env_vars
end

When(/^I click Cancel$/) do
  on(ManageHouseholdsPage) do |page|
    page.wait_until do
      page.cancel_button_element.disabled? == false
    end
    sleep 1
    page.cancel_button
  end
end

When(/^I wait for the page to revert$/) do
  on(NPSPSettingsPage) do |page|
    page.wait_until(10) do
      page.loading_message_element.visible? == false
    end
  end
end