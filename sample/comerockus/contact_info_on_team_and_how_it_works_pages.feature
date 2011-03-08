Feature: Show Contact Information on The Team Page and The How It Works Page
  In order to get ahold of us
  A Site Visitor
  wants to see our contact info easily
  

  Scenario: Show Contact Info on Team Page
    Given I am on the team page
    Then I should see "info AT comerock.us"
    Then I should see "877 823 8808"

  Scenario: Show Contact Info on How It Works Page
    Given I am on the about page
    Then I should see "info AT comerock.us"
    Then I should see "877 823 8808"
 
