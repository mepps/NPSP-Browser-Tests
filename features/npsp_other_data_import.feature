Feature: Data Import page

  @smoketest
  Scenario: Data Import New button
    When I navigate to the other NPSP Data Import
      And I click New
    Then I should see the NPSP Data Import Edit page
