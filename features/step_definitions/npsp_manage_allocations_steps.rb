Given(/^I create a GAU named "([^"]*)"$/) do |gau_name|
  create_gau_via_api(gau_name)
  @array_of_gaus << @gau_id
end