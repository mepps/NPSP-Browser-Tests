Then(/^I should see the Manage Soft Credits page$/) do
  on(NPSPManageSoftCreditsPage) do |page|
    expect(page.body_content).to match /Primary Donor.+Total Amount.+Soft Credit Amount.+Total Unaccounted.+SOFT CREDIT RESTRICTIONS.+Amount.+Percent.+Allow Soft Credit Amount more than Total Amount/m
  end
end
