Feature: Visit Site Pages
  In order to visit the pages of the site
  A Site Visitor
  wants to be able to click around
  

  Scenario: Go From the Home Page To The About Page "How It Works"
    Given I am on the home page
    When I follow "How It Works"
    Then I should be on the about page
 
  Scenario: Go From the Home Page To The Team Page
    Given I am on the home page
    When I follow "Team"
    Then I should be on the team page
    Then I should see "Michael Orr"
    Then I should see "Hex"
    Then I should see "David Celis"
    Then I should see "John Bent Cope"
    Then I should see "Daniel Lewis"

  Scenario: Go From the Team Page To The Home Page
    Given I am on the team page
    When I follow "ComeRock.Us"
    Then I should be on the home page
