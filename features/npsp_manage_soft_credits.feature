Feature: Manage Soft Credits test

  @smoketest
  Scenario: Manage Soft Credits
    Given I create a new Contact via the API
      And I create a new Opportunity via the API with stage name "Qualification" and close date "2020-01-01" and amount "1000"
      When I navigate to Manage Soft Credits for that Opportunity