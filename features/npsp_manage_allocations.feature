Feature: NPSP Manage Allocations Page Test

  Scenario: Manage Allocations
    Given I login with oauth
      And I create an Opportunity and a GAU for allocations
    When I navigate to the Manage Allocations page
      And I add a row
      And I enter "100" in the Amount for the first row
      And I enter "10" in the Percent for the second row
    Then Delete Row should be present
      And Amount in the first row should be disabled
      And Percent in the second row should be disabled
      And Save and Close should be present
