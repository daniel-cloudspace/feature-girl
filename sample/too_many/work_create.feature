@works @tags
Feature: Create Works
  In order to have an archive full of works
  As an author
  I want to create new works

  Scenario: You can't create a work unless you're logged in
  When I go to the new work page
  Then I should see "Please log in"

  Scenario: Creating a new minimally valid work
    Given basic tags
      And I am logged in as "newbie" with password "password"
    When I go to the new work page
    Then I should see "Post New Work"
      And I select "Not Rated" from "Rating"
      And I check "No Archive Warnings Apply"
      And I fill in "Fandoms" with "Supernatural"
      And I fill in "Work Title" with "All Hell Breaks Loose"
      And I fill in "content" with "Bad things happen, etc."
    When I press "Preview"
    Then I should see "Preview Work"
    When I press "Post"
    Then I should see "Work was successfully posted."
    When I go to the works page
    Then I should see "All Hell Breaks Loose"

  Scenario: Creating a new minimally valid work and posting without preview
    Given basic tags
      And I am logged in as "newbie" with password "password"
    When I go to the new work page
    Then I should see "Post New Work"
      And I select "Not Rated" from "Rating"
      And I check "No Archive Warnings Apply"
      And I fill in "Fandoms" with "Supernatural"
      And I fill in "Work Title" with "All Hell Breaks Loose"
      And I fill in "content" with "Bad things happen, etc."
    When I press "Post without preview"
    Then I should see "Work was successfully posted."
    And I should see "Bad things happen, etc."
    When I go to the works page
    Then I should see "All Hell Breaks Loose"

  Scenario: Creating a new minimally valid work when you have more than one pseud
    Given basic tags
      And I am logged in as "newbie" with password "password"
      And "newbie" creates the pseud "Pointless Pseud"
      And I follow "Edit"
      And I check "Is default"
      And I press "Update"
    Then I should see "Pseud was successfully updated."
    When I go to the new work page
    Then I should see "Post New Work"
      And I select "Not Rated" from "Rating"
      And I check "No Archive Warnings Apply"
      And I select "Pointless Pseud" from "work_author_attributes_ids_"
      And I fill in "Fandoms" with "Supernatural"
      And I fill in "Work Title" with "All Hell Breaks Loose"
      And I fill in "content" with "Bad things happen, etc."
    When I press "Preview"
    Then I should see "Preview Work"
    When I press "Post"
    Then I should see "Work was successfully posted."
    When I go to the works page
    Then I should see "All Hell Breaks Loose"

  Scenario: Creating a new work with everything filled in, and we do mean everything
    Given basic tags
      And a category exists with name: "Gen", canonical: true
      And a category exists with name: "F/M", canonical: true
      And the following activated users exist
        | login          | password    | email                 |
        | coauthor       | something   | coauthor@example.org  |
        | cosomeone      | something   | cosomeone@example.org |
        | giftee         | something   | giftee@example.org    |
        | recipient      | something   | recipient@example.org |
      And the following collections exist
        | name        | title        |
        | collection1 | Collection 1 |
        | collection2 | Collection 2 |
      And I am logged in as "thorough" with password "something"
      And all emails have been delivered
    When I go to thorough's user page
      And I follow "Profile"
    Then I should see "About"
    When I follow "Manage My Pseuds"
    Then I should see "Pseuds for"
    When I follow "New Pseud"
    Then I should see "New pseud"
    When I fill in "Name" with "Pseud2"
      And I press "Create"
    Then I should see "Pseud was successfully created."
    When I follow "Back To Pseuds"
      And I follow "New Pseud"
      And I fill in "Name" with "Pseud3"
      And I press "Create"
    Then I should see "Pseud was successfully created."
    When I go to the new work page
    Then I should see "Post New Work"
    When all emails have been delivered
      And I select "Not Rated" from "Rating"
      And I check "No Archive Warnings Apply"
    Then I should see "F/M"
      And I should see "Gen"
    When I check "F/M"
      And I fill in "Fandoms" with "Supernatural"
      And I fill in "Work Title" with "All Something Breaks Loose"
      And I fill in "content" with "Bad things happen, etc."
      And I check "front-notes-options-show"
      And I fill in "work_notes" with "This is my beginning note"
      And I fill in "work_endnotes" with "This is my endingnote"
      And I fill in "Summary" with "Have a short summary"
      And I fill in "Characters" with "Sam Winchester, Dean Winchester,"
      And I fill in "Relationships" with "Harry/Ginny"
      And I fill in "Recipient" with "Someone else, recipient"
      And I check "series-options-show"
      And I fill in "work_series_attributes_title" with "My new series"
      And I select "Pseud2" from "work_author_attributes_ids_"
      And I select "Pseud3" from "work_author_attributes_ids_"
      And I fill in "pseud_byline" with "coauthor"
      And I fill in "work_collection_names" with "collection1, collection2"
      And I press "Preview"
    Then I should see "Preview Work"
    When I press "Post"
    Then I should see "Work was successfully posted."
      And 1 email should be delivered to "coauthor@example.org"
      And the email should contain "You have been listed as a coauthor"
      And 1 email should be delivered to "recipient@example.org"
      And the email should contain "A gift story has been posted for you"
    When I go to the works page
    Then I should see "All Something Breaks Loose"
    When I follow "All Something Breaks Loose"
    Then I should see "All Something Breaks Loose"
      And I should see "Fandom: Supernatural"
      And I should see "Rating: Not Rated"
      And I should see "No Archive Warnings Apply"
      And "warning redesign" is fixed
      #And I should not see "Choose Not To Use Archive Warnings"
      And I should see "Category: F/M"
      And I should see "Characters: Sam Winchester, Dean Winchester"
      And I should see "Relationship: Harry/Ginny"
      And I should see "For Someone else, recipient"
      And I should see "Collections: Collection 1, Collection 2"
      And I should see "Notes"
      And I should see "This is my beginning note"
      And I should see "See the end of the work for more notes"
      And I should see "This is my endingnote"
      And I should see "Summary"
      And I should see "Have a short summary"
      And I should see "Pseud2" within ".byline"
      And I should see "Pseud3" within ".byline"
      And I should see "My new series"
      And I should see "Bad things happen, etc."
    When I follow "Add Chapter"
      And I fill in "title" with "This is my second chapter"
      And I fill in "content" with "Let's write another story"
      And I press "Preview"
    Then I should see "Chapter 2: This is my second chapter"
      And I should see "Let's write another story"
    When I follow "Post Chapter"
    Then I should see "All Something Breaks Loose"
      And I should see "Chapter 1"
      And I should see "Bad things happen, etc."
      And I should not see "Let's write another story"
    When I follow "Next Chapter"
    Then I should see "Chapter 2: This is my second chapter"
      And I should see "Let's write another story"
      And I should not see "Bad things happen, etc."
    When I follow "View Entire Work"
    Then I should see "Bad things happen, etc."
      And I should see "Let's write another story"
    When I follow "Edit"
      And I check "co-authors-options-show"
      And I fill in "pseud_byline" with "Does_not_exist"
      And I press "Preview"
    Then I should see "Please verify the names of your co-authors"
      And I should see "These pseuds are invalid: Does_not_exist"
    When all emails have been delivered
      And I fill in "pseud_byline" with "cosomeone"
    Then I should find "cosomeone" within ".auto_complete"
    When I press "Preview"
      And I press "Update"
    Then I should see "Work was successfully updated"
      And I should see "cosomeone" within ".byline"
      And I should see "coauthor" within ".byline"
      And I should see "Pseud2" within ".byline"
      And I should see "Pseud3" within ".byline"
      And 1 email should be delivered to "cosomeone@example.org"
    When all emails have been delivered
      And I follow "Edit"
      And I fill in "work_recipients" with "giftee"
      And I press "Preview"
      And I press "Update"
    Then I should see "Work was successfully updated"
      And I should see "For giftee"
      And "issue 1807" is fixed
      # And 1 email should be delivered to "giftee@example.org"
    When I go to giftee's user page
    Then I should see "Gifts (1)"

  Scenario: Creating a new work with some maybe-invalid things
  # TODO: needs some more actually invalid things as well
    Given basic tags
      And a category exists with name: "Gen", canonical: true
      And a category exists with name: "F/M", canonical: true
      And the following activated users exist
        | login          | password    | email                 |
        | coauthor       | something   | coauthor@example.org  |
        | cosomeone      | something   | cosomeone@example.org |
        | giftee         | something   | giftee@example.org    |
        | recipient      | something   | recipient@example.org |
      And I am logged in as "thorough" with password "something"
    When I go to thorough's user page
      And I follow "Profile"
    Then I should see "About"
    When I follow "Manage My Pseuds"
    Then I should see "Pseuds for"
    When I follow "New Pseud"
    Then I should see "New pseud"
    When I fill in "Name" with "Pseud2"
      And I press "Create"
    Then I should see "Pseud was successfully created."
    When I follow "Back To Pseuds"
      And I follow "New Pseud"
      And I fill in "Name" with "Pseud3"
      And I press "Create"
    Then I should see "Pseud was successfully created."
    When I go to the new work page
    Then I should see "Post New Work"
    When all emails have been delivered
      And I select "Not Rated" from "Rating"
      And I check "No Archive Warnings Apply"
    Then I should see "F/M"
      And I should see "Gen"
    When I check "F/M"
      And I fill in "Fandoms" with "Invalid12./"
      And I fill in "Work Title" with "/"
      And I fill in "content" with "T"
      And I check "chapters-options-show"
      And I fill in "work_wip_length" with "text"
      And I press "Preview"
    Then I should see "Brevity is the soul of wit, but your content does have to be at least 10 characters long."
    When I fill in "content" with "Text and some longer text"
      And I fill in "work_collection_names" with "collection1, collection2"
      And I press "Preview"
    Then I should see "We couldn't save this Work, sorry!"
      And I should see "We couldn't find a collection with the name collection1"
      And I should see "We couldn't find a collection with the name collection2"
    When I fill in "work_collection_names" with ""
      And I press "Preview"
    Then I should see "Draft was successfully created"
      And I should see "Chapter"
      And I should see "1/?"

  Scenario: test for integer title
    Given basic tags
      And I am logged in as "newbie" with password "password"
    When I go to the new work page
    Then I should see "Post New Work"
      And I select "Not Rated" from "Rating"
      And I check "No Archive Warnings Apply"
      And I fill in "Fandoms" with "Supernatural"
      And I fill in "Work Title" with "02138"
      And I fill in "content" with "Bad things happen, etc."
    When I press "Post without preview"
    Then I should see "Work was successfully posted."
    And I should see "Bad things happen, etc."
    When I go to the works page
    Then I should see "02138"

