Feature: NPSP Settings Recurring Donations

  Background:
    Given I navigate to NPSP Settings
      And I navigate to Recurring Donations Recurring Donations

    @smoketest @reset_recurring_donations_settings
  Scenario: Actually save Settings
    When I change Recurring Donations settings
      And I click Save Recurring Donations Settings
    Then Recurring Donations settings should be saved



