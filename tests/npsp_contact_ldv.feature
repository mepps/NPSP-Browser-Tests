Feature: Create Contact for LDV org

  Background:
   Given I login with oauth
      And I navigate to New Contact

  Scenario: Add Contact
    When I fill in last name
      And I click Save
    Then I should see the new contact name
      And I should see the Household account for the new contact
      And I delete the contact
