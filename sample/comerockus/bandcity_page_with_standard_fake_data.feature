Feature: Visit Band/City Page With Standard Test Dataset
  In order to get into the site
  A Site Visitor
  wants to be able to see and click around stuff
  
  Scenario: Seeing Band/City
    Given the standard test data set
    Given I am on the home page
    When I follow "Nine Inch Nails"
    When I follow the redirect
    Then I should see "Please log in to pledge to get Nine Inch Nails to play in Chicago, IL"
    Then I should see "Tweet"
    Then I should see "Brooks Swenson $500"
    Then I should see "Michael Orr $200"
    Then I should see "Orlando, FL $700"

@testdata
  Scenario: Seeing Band/City and Changing City
    Given the standard test data set
    Given I am on the home page
    When I follow "Nine Inch Nails"
    When I follow the redirect
    Then I should see "Please log in to pledge to get Nine Inch Nails to play in Chicago, IL"
    When I follow "[Change]"
    When I follow "Austin, TX" within "#nearby_cities"
    When I follow the redirect
    Then I should see "Please log in to pledge to get Nine Inch Nails to play in Austin, TX"
