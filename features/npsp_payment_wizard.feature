Feature: Payment wizard test

  @smoketest
  Scenario: Invoke payment wizard
    Given I login with oauth
      And I create a new Opportunity via the API with stage name "Qualification" and close date "2020-01-01" and amount "1000"
    When I navigate to Payment Wizard for that Opportunity
    Then I should see the Payment Wizard fields
