Feature: NPSP Settings Donations

  Background:
    Given I navigate to NPSP Settings

  @smoketest @reset_these_settings @chrome
  Scenario: Actually save Donations Batch Entry Settings
    Given I navigate to Settings Donations Batch Entry
    When I change Donations Batch Entry settings
      And I click Save Donations Batch Entry settings
    Then Donations Batch Entry settings should be saved
      And when I refresh the Donations Batch Entry page my changes should be visible

  @reset_these_settings @chrome
  Scenario: Actually save Donations Contact Roles Settings
   Given I navigate to Settings Donations Contact Roles
    When I change Donations Contact Roles settings
      And I click Save Donations Contact Roles settings
    Then Donations Contact Roles settings should be saved
      And when I refresh the Donations Contact Roles page my changes should be visible
