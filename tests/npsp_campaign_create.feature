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
      And I have two different groups with sources
      And I choose yet another source of records to be excluded
      And I generate the Campaign
    Then my result should have no duplicate members
      And my result should have no members in the set to be excluded

  Scenario: Clear existing Campaign
    Given I have created a campaign
    When I change the criteria for my campaign
      And I click Add Members
      And I dismiss the warning that criteria have changed
    Then I should see my new campaign
