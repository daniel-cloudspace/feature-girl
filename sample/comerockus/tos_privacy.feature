Feature: Visit Terms and Privacy Policy
  In order to visit the pages of the site
  A Site Visitor
  wants to be able to click around
  

@priv
  Scenario: Go From the Terms of Service Page
    Given I am on the home page
    When I follow "Terms of Service"
    Then I should be on the terms of service page

@priv
  Scenario: Go From the Privacy Policy Page
    Given I am on the home page
    When I follow "Privacy Policy"
    Then I should be on the privacy policy page
