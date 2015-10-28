Feature: NPSP Manage Allocations Page Test

  Background:
    Given I login with oauth
    And I create an Opportunity for "1000"
    And I create a GAU for allocations

  Scenario: Manage Allocations
    When I navigate to the Manage Allocations page
      And I add a row
      And I enter "100" in the Amount for the first row
      And I enter "10" in the Percent for the second row
    Then Delete Row should be present
      And Percent in the first row should be disabled
      And Account in the second row should be disabled
      And Save and Close should be present

  Scenario: Manage Allocations error
    When I navigate to the Manage Allocations page
      And I enter "1001" in the Amount for the first row
    And I enter "10" in the Percent for the second row
      Then I should see an error message