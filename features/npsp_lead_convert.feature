Feature: Lead Convert test

  @smoketest
  Scenario: Check Lead Convert page
    Given I login with oauth
      And I create a new Lead via the API
    When I navigate to Lead Convert page for the Lead
    Then I should see the Lead Convert page for the Lead