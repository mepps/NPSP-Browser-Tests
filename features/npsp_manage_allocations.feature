Feature: NPSP Manage Allocations Page Test

  Background:
    Given I login with oauth
    And I create an Opportunity for "1000"
    And I create two GAUs for allocations

  Scenario: Manage Allocations
    When I navigate to the Manage Allocations page
      And I add a row
      And I enter "100" in the Amount for the first row for one GAU
      And I enter "10" in the Percent for the second row for the other GAU
    Then Delete Row should be present
      And Percent in the first row should be disabled
      And Account in the second row should be disabled
      And Save and Close should be present

  Scenario: Manage Allocations amount error
    When I navigate to the Manage Allocations page
      And I enter "1001" in the Amount for the first row
      And I enter "10" in the Percent for the second row
      And I click Save
    Then I should see an error message

  Scenario: Manage Allocations percent error
    When I navigate to the Manage Allocations page
    And I enter "1000" in the Amount for the first row
    And I enter "101" in the Percent for the second row
    And I click Save
    Then I should see an error message

  Scenario: Manage Allocations GAU error
    When I navigate to the Manage Allocations page
      And I enter "100" in the Amount for the first row for one GAU
      And I enter "10" in the Percent for the second row for the same GAU
      And I click Save
    Then I should see an error message
