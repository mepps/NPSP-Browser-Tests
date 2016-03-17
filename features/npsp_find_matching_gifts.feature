Feature: Matching Donation test

  @smoketest
  Scenario: Invoke Matching Donation
    Given I create a new Contact via the API
      And I create a new Opportunity via the API with stage name "Qualification" and close date "2020-01-01" and amount "1000"
    When I navigate to Find Matching Gifts for that Opportunity
    Then I should see the information for my opportunity
      And I should see the headers for matching opportunities
      And I should be able to search for matching opportunities
      And I should see a Cancel button
      And when I click Search I should see an error "Warning" and "Please specify one or more filters in order to search."

  Scenario: Find Matching Gift
    Given I create two Opportunities to be matched
    When I navigate to Find Matching Gifts for that Opportunity