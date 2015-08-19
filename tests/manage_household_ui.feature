Feature: Manage Household UI

  Background:
   Given I login with oauth

  Scenario: Navigate to Manage Households UI and do basic checks
    When I click the Accounts tab
      And I select "Household Accounts" and Go
      And I click the first Household Account
      And I click Manage Household
    Then I should see the Household Members section
      And I should see the Add Members search field
      And I should see the Household Naming section
      And I should see the Household Details section

  Scenario: Add Members to Household
    Given I navigate to Manage Households UI
    When I type "a" into search box
      And I select the first result
      And I add to household with Add and merge Households option
      And I type "b" into search box
      And I select the first result
      And I add to household with Add and remove from old Household option
    Then I should see three Household Member entries

  Scenario: Change Household address
    Given I navigate to Manage Households UI
    When I click Change on Household Address
      And I click Select an existing address
      And I click Enter a new address
      And I fill in the five address fields
      And I click Set Address
    Then the five address fields should appear in the Household Address section in the correct order

  Scenario: Checkboxes for Exclude Contact and Auto Name
    Given I navigate to Manage Households UI
    When I type "a" into search box
      And I select the first result
      And I add to household with Add and merge Households option
      And I click the checkboxes in the original address card
      And I click the checkboxes in the second address card
      And I click the three Auto checkboxes
    Then I should see all nine checkboxes checked

  Scenario: Cancel button returns to Manage Household page
    Given I navigate to Manage Households UI
    When I type "a" into search box
    And I select the first result
    And I add to household with Add and merge Households option
    And I click Cancel
  Then I should be on the regular Households page




