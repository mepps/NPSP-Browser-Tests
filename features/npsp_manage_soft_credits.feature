Feature: Manage Soft Credits test

  @smoketest
  Scenario: Manage Soft Credits
    Given I create a new Contact via the API
      And I create a new Opportunity via the API with stage name "Qualification" and close date "2020-01-01" and amount "1000"
    When I navigate to Manage Soft Credits for that Opportunity
    Then I should see the Manage Soft Credits page

  Scenario: Add Partial Soft Credit more than amount
    Given I create two Opportunities to be matched
    When I navigate to Soft Credits page for the original Opportunity
      And I click Percent
      And I click Allow soft credit more than amount
      And I add a new soft credit for the second Contact with a Role for amount "1234"
    Then I should see the new Contact Role on the Opportunity

  Scenario: Add Partial Soft Credit full amount
    Given I create two Opportunities to be matched
    When I navigate to Soft Credits page for the original Opportunity
      And I add a new soft credit for the second Contact with a Role for full amount
    Then I should see "100.00" in the Amount field and Save
      And I should see the new Contact Role on the Opportunity

  Scenario: Soft Credit Errors
    Given I create two Opportunities to be matched
    When I navigate to Soft Credits page for the original Opportunity
      And I add a new soft credit for a bogus Contact with a Role for full amount
    Then I should see the bad Contact error
