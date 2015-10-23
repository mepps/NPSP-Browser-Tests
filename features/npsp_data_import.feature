Feature: Data Import page

  @smoketest
  Scenario: Data Import page
    Given I login with oauth
    When I navigate to NPSP Data Import
      And I set Batch Size to 60
      And I set Contact Matching Rule to "First Name and Last Name"
      And I set Contact Custom Unique ID to "- none -"
      And I set Account Custom Unique ID to "- none -"
      And I click Begin Data Import Process
    Then I should see the Data Import status
