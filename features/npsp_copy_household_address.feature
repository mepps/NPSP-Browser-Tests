Feature: Copy Household Address to/from Contacts

  Background:
   Given I login with oauth
    And I change the Account Model to "One-to-One"
    And I create a new Contact via the API
    
  Scenario: Copy Household Address to/from Contacts
    When I navigate to Copy Address page for the Contact