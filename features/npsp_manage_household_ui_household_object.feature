Feature: Manage Household UI One-to-One

  Background:
   Given I create new Contacts with Household Object via the API

  Scenario: Navigate to Manage Households UI and do basic checks
    When I navigate to Manage Households UI for Household Object
    Then I should see the Household Members section
    And I should see the Add Members search field
    And I should see the Household Naming section
    And I should see the Household Details section

  Scenario: Add Members to Household
    Given I create two Contacts "aaa" and "bbb" to be added to Household
    And I navigate to Manage Households UI for Household Object
    When I type "aaa" into search box
    And I add to household with Add option
    And I add to household with Add and merge Households option
    And I click New Contact
    And I type "bbb" into search box
    And I add to household with Add option
    And I add to household with Add and remove from old Household option
    Then I should see three Household Member entries

  Scenario: Change Household address
    Given I navigate to Manage Households UI for Household Object
    When I click Change on Household Address
    And I click Enter a new address
    And I fill in the five address fields
    And I click Set Address
    Then the five address fields should appear in the Household Address section in the correct order

  Scenario: Checkboxes for Exclude Contact and Auto Name
    Given I create two Contacts "ccc" and "ddd" to be added to Household
    And I navigate to Manage Households UI for Household Object
    When I type "ddd" into search box
    And I add to household with Add option
    And I add to household with Add and merge Households option
    And I click the checkboxes in the original address card
    Then I should see all three checkboxes checked

  Scenario: Cancel button returns to Manage Household page
    Given I create two Contacts "eee" and "fff" to be added to Household
    And I navigate to Manage Households UI for Household Object
    When I type "fff" into search box
    And I add to household with Add option
    And I add to household with Add and remove from old Household option
    And I click Cancel
    Then I should be on the regular Households page
