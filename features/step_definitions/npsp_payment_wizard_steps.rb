When(/^I change number of payments from "([^"]*)" to "([^"]*)"$/) do |existing_payments, new_payments|
  on(PaymentWizardPage).number_of_payments = new_payments
end

When(/^I click Calculate Payments$/) do
  on(PaymentWizardPage).calculate_payments_element.when_present.click
end

When(/^I click Create Payments$/) do
  on(PaymentWizardPage).create_payments_button
end

When(/^I click on the ninth link to a Payment record$/) do
  on(PaymentWizardPage).ninth_payment_link_element.when_present.click
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
