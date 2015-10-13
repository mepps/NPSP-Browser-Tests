Feature: Contact Merge test

  @smoketest
  Scenario: Contact Merge select and merge
    Given I login with oauth
      And I create three Contacts "aaa1" and "aaa2" and "aaa3"
      And I navigate to Contact Merge
      And I do a Contact Merge search for "aaa"
    When I select the second Contact as the winning Contact
      And I merge the contacts
    Then I should see "aaa2" in All Contacts
      And I should not see "aaa1" or "aaa3" in All Contacts
