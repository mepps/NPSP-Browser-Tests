Feature: Account created via API is automatically a Household account

  @smoketest
  Scenario: Create new random account
    Given I create a new random account via the API
    When I navigate to All Accounts
    Then I should see the new account is a Household account

  Scenario: Delete created account
    Given I delete the random account via the API
    When I navigate to All Accounts
    Then I should not see the random account created earlier
  #SFDO API PROBLEM, SELECT() FOR true_object_name RETURNS WRONG VALUE FOR STANDARD SF OBJECTS