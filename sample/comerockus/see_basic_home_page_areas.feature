Feature: See Basic Home Page Features
  In order to find out what is popular and recent on the site from the home page
  A Site Visitor
  wants to be able to see recent pledges and top cities, bands, and pledgers
  

  Scenario: Go From the Home Page And See Basic Sections
    Given I am on the home page
    Then I should see "Recent Pledges"
    Then I should see "Top Bands"
    Then I should see "Top Cities"
    Then I should see "Top Pledgers"
