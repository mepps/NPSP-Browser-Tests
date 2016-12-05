Feature: NPSP Settings Relationships

  Background:
    Given I navigate to NPSP Settings

  @smoketest @reset_relationships @chrome
  Scenario: Actually save Relationships Settings
    Given I navigate to Relationships Relationships
    When I change Relationships Reciprocal Method settings
      And I click Save Relationships Settings
    Then Relationships settings should be saved
      And when I refresh the Relationships Relationships page my changes should be visible

  @smoketest @reset_aff_relationships @chrome
  Scenario: Actually save Relationships Settings Affiliations
    Given I navigate to Relationships Affiliations
    When I change Relationships Affiliations settings
      And I click Save Relationships Affiliations Settings
    Then Relationships Affiliations settings should be saved
      And when I refresh the Relationships Affiliations page my changes should be visible
