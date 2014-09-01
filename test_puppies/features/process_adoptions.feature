Feature: Process Adoptions

  Background:
    Given I am on the puppy adoption site

  Scenario: Verify message when adoption is processed
    Given I have a pending adoption for "Tom Jones"
    When I process that adoption
    Then I should see "Please thank Tom Jones for the order!"
