
Feature: NPSP Settings Donations Opportunity Names

  Background:
    Given I login to settings with environment variables
    When I navigate to Settings Donations Opportunity Names

  Scenario: Household Name Settings set values
    When I retrieve existing DNO values
      And I set Attribution to "Contact Donations"
      And I set Opportunity Record Types to "NPSP Default"
      And I Opportunity Name Format to "other"
      And I set the date format to "yyyy-MM-dd"
      And I click Cancel
      And I wait for the page to revert
    Then I should see the original DNO values on the page
