Feature: Posts
  As a user of the blog
  I want to be able to view, create, edit, and destroy posts
  So that I can manage my content

  Scenario: create a post
    Given I am on the home page
    And I follow "New post"
    When I fill in the following:
      | Title | Frist |
      | Body  | I have arrived at this blog first and am in a rush to identify myself, thus I am unconscientious of grammar. |
    And press "Create"
    Then I should see "Post was successfully created."

  Scenario: view a post
    Given a post with title "First Post" and body "If I said you have a nice body, would you enclode it </body>? I mean, compliance, and all."
    When I go to the home page
    And follow "First Post"
    Then I should see "Title: First Post"

  Scenario: view posts list
    Given a post with title "First Post" and body "If I said you have a nice body, would you enclode it </body>? I mean, compliance, and all."
    And I am on the home page
    Then I should see "Listing posts"
    And I should see "Title Body"
    And I should see "First Post Edit Delete"
    And I should see "New post"

  Scenario: edit a post
    Given a post with title "First Post" and body "If I said you have a nice body, would you enclode it </body>? I mean, compliance, and all."
    When I go to the home page
    And follow "First Post"
    And follow "Edit"
    When I fill in "Body" with "This is an edit, instead of the original message"
    And press "Update"
    Then I should see "Body: This is an edit, instead of the original message"

  Scenario: destroy a post
    Given a post with title "First Post" and body "If I said you have a nice body, would you enclode it </body>? I mean, compliance, and all."
    When I go to the home page
    And follow "First Post"
    When I follow "Delete Post"
    Then I should be on the posts page
