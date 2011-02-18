Feature: Users
  In order to learn more
  As a user
  I want to manage my account

### Ticket #19 Ensuring that an image is uploaded when registering an account

  @javascript
  Scenario: Creating an account
    Given I am on the new users page
    When I fill in "new_user" for "user_login"
    And I fill in "new_user@punkgrok.com" for "user_email"
    And I fill in "abcd1234" for "user_password"
    And I fill in "abcd1234" for "user_password_confirmation"
    And I upload an image for "user_avatar"
    And I press "Register"
    Then I should see "Account registered!"

### Ticket #6 View a public profile and view courses I have completed and easily access
### courses I am taking

  @javascript
  Scenario: View my profile
    Given I am logged in as "user"
    When I follow "user"
    Then I should see "user" within "#inner_wrapper"
    And I should see "Current Courses"
    And I should see "Completed Courses"
