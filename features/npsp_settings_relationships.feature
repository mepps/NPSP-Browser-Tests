Feature: NPSP Settings Relationships

  @smoketest @reset_relationships @chrome
  Scenario: Actually save Relationships Settings
    Given I navigate to NPSP Settings
      And I navigate to Relationships Relationships
    When I change Relationships Gender Field settings
      And I click Save Relationships Settings
    Then Relationships settings should be saved
      And when I refresh the Relationships Relationships page my changes should be visible
