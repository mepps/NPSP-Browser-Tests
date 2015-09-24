Feature: Getting Started page

  @smoketest
  Scenario: Getting Started text and links
    Given I login with oauth
    When I click the Getting Started tab
    Then I should see the Getting Started text
      And I should see the Getting Started links
