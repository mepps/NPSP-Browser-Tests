Feature: Manage Household UI

  Background:
   Given I login with oauth
    And I create a new random account via the API

  Scenario: Navigate to Manage Households UI and do basic checks
    When I navigate to Manage Households UI
    Then I should see the Household Members section
      And I should see the Add Members search field
      And I should see the Household Naming section
      And I should see the Household Details section
      And I delete the account

  Scenario: Add Members to Household
    Given I navigate to Manage Households UI
    When I type "a" into search box
      And I select the first result
      And I type "b" into search box
      And I add to household with Add option
    Then I should see two Household Member entries
      And I delete the account

  Scenario: Change Household address
    Given I navigate to Manage Households UI
    When I click Change on Household Address
      And I click Select an existing address
      And I click Enter a new address
      And I fill in the five address fields
      And I click Set Address
    Then the five address fields should appear in the Household Address section in the correct order
      And I delete the account

  Scenario: Checkboxes for Exclude Contact and Auto Name
    Given I navigate to Manage Households UI
    When I type "a" into search box
      And I add to household with Add option
      And I click the checkboxes in the original address card
    Then I should see all three checkboxes checked
      And I delete the account

  Scenario: Cancel button returns to Manage Household page
    Given I navigate to Manage Households UI
    When I type "a" into search box
    And I add to household with Add option
    And I click Cancel
  Then I should be on the regular Households page
    And I delete the account




