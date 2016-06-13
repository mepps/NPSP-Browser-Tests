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
      And I add to household with Add and merge Households option
      And I click New Contact
      And I type "bbb" into search box
      And I add to household with Add option
      And I add to household with Add and remove from old Household option
    Then I should see three Household Member entries

  Scenario: Change Household address
    Given I navigate to Manage Households UI for contact
      And I see Contact name
      And I see existing address fields
      And I see the Household Name
      And I see the Formal Greeting
      And I see the Primary Contact
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

    #NEW FUNCTION:
    #Upon merging a contact to a household when the contact has a different address, the merged contacts address will be
  #attached to the household record.
   # Upon merging a contact from a household with multiple contacts, UI will prompt as to whether to move the one contact
    #or to move all the members.

  #NEW: CHECK DRAGGING CARDS
  # CHECK ORDER IN TEXTFIELDS AFTER DRAGGING CARDS

  #DELETE CONTACTS FROM HOUSEHOLDS

  # SET ADDRESS FOR ALL CONTACTS
  # CHANGE ADDRESSS

  #DELETE PRIMARY CONTACT TEST?

  #CHECK ADDRESS OVERRIDE: ONE CONTACT HAS STABLE DIFFERENT ADDRESS

  #CHECK BREADCRUMBS LINKS FOR TRUE

  #CHECK THAT SOME ITEM THAT SHOULD BE DENIED DOES NOT APPEAR. E.G. USER DOES NOT HAVE PERM TO DELETE CONTACT,
  #DELETE BUTTON SHOULD NOT BE VISIBLE

  Scenario: Checkboxes for Exclude Contact and Auto Name
    Given I create two Contacts "ccc" and "ddd" to be added to Household
      And I navigate to Manage Households UI
    When I type "ddd" into search box
      And I add to household with Add option
      And I add to household with Add and merge Households option
      And I click the checkboxes in the original address card
    Then I should see all three checkboxes checked
      And I should see the default text in the page textfields change appropriately

  Scenario: Cancel button returns to Manage Household page
    Given I create two Contacts "eee" and "fff" to be added to Household
      And I navigate to Manage Households UI
    When I type "fff" into search box
      And I add to household with Add option
      And I add to household with Add and remove from old Household option
      And I click Cancel
    Then I should be on the regular Households page
