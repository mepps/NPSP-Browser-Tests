Given(/^I create a Relationship for those contacts$/) do
  create_relationship_via_api(@array_of_contacts[0], @array_of_contacts[1])
end

Then(/^I should see the relationship in Relationship Viewer$/) do
  expect(on(NPSPRelationshipViewerPage).canvas_field_element).to be_visible
end