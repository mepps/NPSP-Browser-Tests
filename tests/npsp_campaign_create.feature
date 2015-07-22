Feature: NPSP Campaign Create

  Background:
   Given I login with environment variables
    And Campaign tab is installed

  Scenario: Create new campaign
    When I click New List
    Then I should see the Create List Wizard
      And I should see the Campaign that created this new List

  Scenario: Create Complex Campaign
    Given I am in the Create Campaign Wizard
    When I choose two input sources from existing Campaigns
      And I choose two input sources from Reports
      And I join the first two sources with "And"
      And I join the next two sources with "Or"
      And I join the final two sources with "Not"
      And I generate the Campaign
    Then data from all four sources should be represented correctly

  Scenario: Clear existing Campaign
    Given I have created a campaign
    When I change the criteria for my campaign
      And I click Add Members
      And I dismiss the warning that criteria have changed
    Then I should see my new campaign
