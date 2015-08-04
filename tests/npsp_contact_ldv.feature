Feature: Create Contact for LDV org

  Background:
   Given I login with environment variables
      And I navigate to New Contact

  Scenario: Add Contact
    When I fill in last name
      And I click Save
    Then I should see the confirmation screen with the new contact info
      And I should see the Household account for the new contact
