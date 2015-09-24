Feature: Relationship Viewer test

  @smoketest
  Scenario: Invoke Relationship Viewer
    Given I login with oauth
      And I create a new Contact via the API with
      And I create a new Contact via the API with
    When I navigate to Relationship Viewer for that Opportunity
    Then I should see the relationship in Relationship Viewer
