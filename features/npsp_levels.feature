@smoketest
Feature: NPSP Levels

  Scenario: Create Engagement Plan Template in UI
    Given I create an Engagement Plan Template
      And I create a Levels field on Account
      And I navigate to Levels
    When I fill in Levels information for "Account"
      And I link to an EPT
      And I save my Level
    Then I should see the proper error message
