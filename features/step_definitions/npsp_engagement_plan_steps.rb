When(/^I fill in EPT information$/) do
  on(EPTPage) do |page|
    page.template_name_element.when_present.send_keys("ept" + @random_string)
  end
end

When(/^I create a Task and a Subtask$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I save my EPT$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^my EPT should exist$/) do
  pending # Write code here that turns the phrase above into concrete actions
end