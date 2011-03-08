Feature: Visit City Page With Standard Test Dataset
  In order to get into the site
  A Site Visitor
  wants to be able to see and click around stuff
  
  Scenario: Seeing City
    Given the standard test data set
    Given I am on the home page
    When I follow "Orlando, FL" within "#recent_pledges"
    Then I should see "Top Pledgers for Orlando, FL"
    Then I should see "Top Pledged Bands for Orlando, FL"

@citypage
  Scenario: Changing Your City on a City Page
    Given the standard test data set
    Given I am on the home page
    When I follow "Orlando, FL" within "#recent_pledges"
    Then I should see "Top Pledgers for Orlando, FL"
    When I follow "Austin, TX" within "#nearby_cities"
    When I follow the redirect
    Then I should see "Top Pledgers for Austin, TX"
