Feature: Comments
  As a reader of the blog
  I want to writen comments on posts
  So that I can contribute to the discussion

  Scenario: create comment
    Given a post with title "First Post" and body "If I said you have a nice body, would you enclode it </body>? I mean, compliance, and all."
    And I am on the posts page
    When I follow "First Post"
    And fill in the following:
      | comment_name | Your Mom |
      | comment_body | I have no son. |
    And I press "Add Comment"
    Then I should see "Your Mom"
    And I should see "I have no son."
  
  Scenario: delete comment
    Given a post with title "First Post" and body "If I said you have a nice body, would you enclode it </body>? I mean, compliance, and all."
    And I am on the posts page
    When I follow "First Post"
    And fill in the following:
      | comment_name | Your Mom |
      | comment_body | I have no son. |
    And I press "Add Comment"
    Then I should see "Your Mom"
    And I should see "I have no son."
    When I follow "Delete Comment"
    Then I should not see "Your Mom"
    And I should not see "I have no son."

  Scenario: view comments on a post
    Given a post with title "First Post" and body "If I said you have a nice body, would you enclode it </body>? I mean, compliance, and all."
    And I am on the posts page
    When I follow "First Post"
    And fill in the following:
      | comment_name | Your Mom |
      | comment_body | I have no son. |
    And I press "Add Comment"
    Then I should see "Your Mom"
    And I should see "I have no son."

