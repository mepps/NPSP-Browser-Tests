Given(/^I create a new Opportunity via the API with stage name "([^"]*)" and close date "([^"]*)" and amount "([^"]*)"$/) do |stage_name, close_date, amount|
  create_opportunity_via_api("aaaaaa#{@random_string}", stage_name, close_date, amount)
end

When(/^I click Calculate Payments$/) do
  on(PaymentWizardPage).calculate_payments_element.when_present.click
end

Then(/^I should see the Payment Wizard fields$/) do
  on(PaymentWizardPage) do |page|
    expect(page.title_text).to match 'Create one or more Payments for this Opportunity'
    expect(page.current_opportunity_title).to match 'Current Opportunity Info'
    expect(page.create_payment_schedule).to match 'Create a Payment Schedule'
    expect(page.payments_to_be_created). to match 'Payments to be Created'
    expect(page.header_line).to match /Payment Number.+Payment Amount.+Scheduled Date.+Payment Date.+Paid/m
    page.wait_until do
      page.twelfth_amount_textfield_element.visible?
    end
    expect(page.twelfth_amount_textfield).to eq '83.33'
    expect(page.create_payments_button_element).to be_visible
  end
end
