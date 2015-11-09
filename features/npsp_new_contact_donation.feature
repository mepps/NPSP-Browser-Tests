Feature: New Contact Donation test

  @smoketest
  Scenario: New Contact Donation page
    Given I create a new Contact via the API
    When I navigate to New Contact Donation Page
    Then I should see the New Opportunity page
      And the Opportunity Name should be set to the correct value
