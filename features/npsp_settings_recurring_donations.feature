Feature: NPSP Settings Recurring Donations

  @smoketest @reset_recurring_donations
  Scenario: Actually save Settings
    Given I navigate to NPSP Settings
      And I navigate to Recurring Donations Recurring Donations
    When I change Recurring Donations settings
      And I click Save Recurring Donations Settings
    Then Recurring Donations settings should be saved
      And when I refresh the page my changes should be visible
