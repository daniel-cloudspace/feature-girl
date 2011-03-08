Feature: Ability to Change Your City
  In order to set their location to something other than the one chosen for them
  A Site Visitor
  wants to be able to change their location and have it persist for them

@citypriv  
  Scenario: Changing City on home page should not redirect them
    Given the standard test data set
    Given I am on the home page
    Then I should see "Chicago, IL [Change]"
    When I follow "Orlando, FL" within "#nearby_cities"
    Then I should see "Orlando, FL [Change]"
@citypriv
  Scenario: Changing City on privacy should not redirect them
    Given the standard test data set
    Given I am on the privacy policy page
    Then I should see "Chicago, IL [Change]"
    When I follow "Orlando, FL" within "#nearby_cities"
    Then I should see "Orlando, FL [Change]"
@citypriv
  Scenario: Changing City on terms of service should not redirect them
    Given the standard test data set
    Given I am on the terms of service page
    Then I should see "Chicago, IL [Change]"
    When I follow "Orlando, FL" within "#nearby_cities"
    Then I should see "Orlando, FL [Change]"
@citypriv
  Scenario: Changing City on team should not redirect them
    Given the standard test data set
    Given I am on the team page
    Then I should see "Chicago, IL [Change]"
    When I follow "Orlando, FL" within "#nearby_cities"
    Then I should see "Orlando, FL [Change]"
