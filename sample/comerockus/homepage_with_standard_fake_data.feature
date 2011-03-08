Feature: Visit Home Page With Standard Test Dataset
  In order to get into the site
  A Site Visitor
  wants to be able to see and click around top bands and cities and pledgers
  

  Scenario: Seeing Top Bands
    Given the standard test data set
    Given I am on the home page
    Then I should see "Nine Inch Nails $700"
    Then I should see "Your Face $400"
    Then I should see "Yo Momma $100"
    Then I should see "Joe Booty $400"


  Scenario: Seeing Top Cities
    Given the standard test data set
    Given I am on the home page
    Then I should see "Orlando, FL $1500"
    Then I should see "San Francisco, CA $100"

  Scenario: Seeing Top Pledgers
    Given the standard test data set
    Given I am on the home page
    Then I should see "Michael Orr $1000"
    Then I should see "Brooks Swenson $600"

  Scenario: Seeing Recent Pledges
    Given the standard test data set
    Given I am on the home page
    Then I should see "Brooks Swenson in Orlando, FL"
    Then I should see " put up $500 for Nine Inch Nails"
    Then I should see "Brooks Swenson in Orlando, FL"
    Then I should see "put up $100 for Your Face"
    Then I should see "Michael Orr in Orlando, FL"
    Then I should see "put up $400 for Joe Booty"
    Then I should see "Michael Orr in Orlando, FL"
    Then I should see "put up $300 for Your Face"
    Then I should see "Michael Orr in Orlando, FL"
    Then I should see "put up $100 for Yo Momma"


