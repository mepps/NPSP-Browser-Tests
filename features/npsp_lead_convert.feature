Feature: Lead Convert test

  Background:
    Given I create a new Lead via the API
    When I navigate to Lead Convert page for the Lead

  @smoketest
  Scenario: Check Lead Convert page
    Then I should see the Lead Convert page for the Lead

  Scenario: Convert Lead with default values
    When I click the Convert button
    Then I should be on the Contact page
      And I should see the name of the Lead