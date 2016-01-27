Feature: Lead Convert test

  Background:
    Given I create a new Lead via the API
    When I navigate to Lead Convert page for the Lead

  @smoketest
  Scenario: Check Lead Convert page
    Then I should see the Lead Convert page for the Lead
