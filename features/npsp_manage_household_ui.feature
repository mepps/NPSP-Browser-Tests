Feature: Manage Household UI

  Background:
    Given I create a new Contact via the API with address "automation street" "automation city" "automation state" "automation country" "automation zip"
      And I create a new random account via the API

    @smoketest
  Scenario: Navigate to Manage Households UI and do basic checks
    When I navigate to Manage Households UI
    Then I should see the Household Members section
      And I should see the Add Members search field
      And I should see the Household Naming section
      And I should see the Household Details section

  Scenario: Add Members to Household
    Given I create two Contacts "aaa" and "bbb" to be added to Household
      And I navigate to Manage Households UI
    When I type "aaa" into search box
      And I add to household with Add option
      And I add to household with Add All Members option
      #And I click New Contact
      And I type "bbb" into search box
      And I add to household with Add option
      And I add to household with Add and remove from old Household option
    Then I should see three Household Member entries

  Scenario: Change Household address
    Given I navigate to Manage Households UI for contact
      And I see Contact name
      And I see existing address fields
      And I see the Household Name
      #And I see the Formal Greeting
      #And I see the Primary Contact
    When I click Change on Household Address
      And I click Select an existing address
      And I click Enter a new address
      And I fill in the five address fields
      And I click Set Address
      And the five address fields should appear in the Household Address section in the correct order
      And I click Manage Household Save
    Then I should be on the Account page
      And I should see the new address containing "street" and "city" and "state" and "zip" and "country"

  Scenario: Copy Household address from added Contact
    Given I navigate to Manage Households UI for contact
      And I create a new Contact via the API with address "automation street TWO" "automation city TWO" "automation state TWO" "automation country TWO" "automation zip TWO"
    When I type the random string into search box
      And I add to household with Add option
      And I add to household with Add and merge Households option
      And I click Manage Household Save
    Then I should be on the Account page
      And I should see the new address containing "automation street" and "automation city" and "automation state" and "automation zip" and "automation country"

  Scenario: Checkboxes for Exclude Contact and Auto Name
    Given I create two Contacts "ccc" and "ddd" to be added to Household
      And I navigate to Manage Households UI
    When I type "ddd" into search box
      And I add to household with Add option
      And I add to household with Add and merge Households option
      And I click the checkboxes in the original address card
    Then I should see all three checkboxes checked

  Scenario: Cancel button returns to Manage Household page
    Given I create two Contacts "eee" and "fff" to be added to Household
      And I navigate to Manage Households UI
    When I type "fff" into search box
      And I add to household with Add option
      And I add to household with Add and remove from old Household option
      And I click Cancel
    Then I should be on the regular Households page
