@smoketest
Feature: NPSP Smoke Test

  Background:
   Given I login with oauth

  Scenario: Recurring Donations link works
    When I click the Recurring Donations link
    Then I should see the Recurring Donations home page
      And I should be able to click the New button

  Scenario: NPSP controls link works
    When I click the NPSP Settings link
    Then I should see the NPSP Application Settings page
