@smoketest
Feature: NPSP Engagement Plan

  Scenario: Create Engagement Plan Template in UI
    Given I create an Engagement Plan Template
      And I navigate to Levels
    When I fill in Levels information for "Account"
      And I save my Level
    Then my Level should exist


