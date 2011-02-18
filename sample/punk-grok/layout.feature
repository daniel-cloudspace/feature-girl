#layout.feature

Feature:
  In order to ensure usability
  As an administrator
  I want to have a pleasant website

  @javascript
  Scenario: Not Logged In But Curious
    Given I am on the home page
    Then I should not see "You must be logged in to access this page"
    When I go to the courses page
	And I follow "Sample Course 1"
    Then I should see "Log in to take this course"
	And I should not see "Take Course"

### Ticket #26 - This ticket ensured that Home and About were removed as menu items

  @javascript
  Scenario: Menu Insurance
    Given I am logged in as "user"
    When I am on user profile page
    Then I should see "Courses"
	And I should see "FAQ"
    And I should not see "Members"
    And I should not see "Home"
    And I should not see "About"
    When I am on the courses page
    Then I should see "Courses"
	And I should see "FAQ"
    And I should not see "Members"
    And I should not see "Home"
    And I should not see "About" 

### Ticket #27 - This ticket asked for "pretty" page titles.

  @javascript
  Scenario: Ensuring Pretty Titles
    Given I am logged in as "user"
    When I am on the courses page
    Then the title should be "Punk Grok - Course Index"
    And the title should not be "Punk Grok"