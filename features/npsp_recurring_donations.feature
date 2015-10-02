@smoketest
Feature: NPSP Recurring Donations

  Background:
   Given I login with oauth
    And I navigate to Recurring Donations

    @smoketest
  Scenario: Recurring Donations generated on save
    When I create a "Monthly" recurring donation for "12" months for "1000.00"
    Then I should see "12" monthly donations for "$83.33"

  Scenario: Recurring Donation Refresh Opportunities open
    When I create a "Monthly" "Open" recurring donation for "12" months for "1000.00"
      And I delete two of the payments
      And I edit the Stage for a payment to be "Qualification"
      And I click "Refresh Opportunities"
    Then I should see a new page for for the Recurring Donation
      And the deleted payments should be restored
      And the Stage for all payments should be "Pledged"
