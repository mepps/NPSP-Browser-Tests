Feature: Batch Data Entry test

  @smoketest
  Scenario: Batch Data Entry fields for Lead
    Given I navigate to Batch Data Entry page
    When I select New Batch for "Lead"
    Then Batch Name should contain "Leads"
      And Batch Status should be "In Progress"
      And I should see a Description textarea
      And I should see four text fields
      And I the Save button should be clickable
