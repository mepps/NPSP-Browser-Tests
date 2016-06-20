When(/^I click New$/) do
  on(NPSPOtherDataImportPage).new_button
end

When(/^I click View All$/) do
  on(NPSPOtherDataImportPage).go_button
end

When(/^I click Start Data Import$/) do
  on(NPSPOtherDataImportPage).start_data_import_button_element.when_present.click
end

Then(/^I should see the NPSP Batch Data Entry page$/) do
  expect(@browser.url).to match /BDI_DataImport\?retURL/
end

Then(/^I should see the NPSP Data Import Edit page$/) do
  expect(on(NPSPOtherDataImportPage).page_info).to match /NPSP Data Import Edit.+New NPSP Data Import/m
end
