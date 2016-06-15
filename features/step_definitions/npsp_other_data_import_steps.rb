When(/^I click New$/) do
  on(NPSPOtherDataImportPage).new_button
end

Then(/^I should see the NPSP Data Import Edit page$/) do
  expect(on(NPSPOtherDataImportPage).page_info).to match /NPSP Data Import Edit.+New NPSP Data Import/m
end
