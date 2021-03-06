@works
Feature: Import Works from DW
  In order to have an archive full of works
  As an author
  I want to create new works by importing them from DW
  
  Scenario: Creating a new work from an DW story with automatic metadata
    Given basic tags
      And a fandom exists with name: "Lewis", canonical: true
      And the following activated user exists
        | login          | password    |
        | cosomeone      | something   |
      And I am logged in as "cosomeone" with password "something"
    When I go to the import page
      And I fill in "urls" with "http://rebecca2525.dreamwidth.org/3506.html"
    When I press "Import"
    Then I should see "Preview Work"
      And I should see "Lewis" within "dd.fandom"
      And I should see "General Audiences" within "dd.rating"
      And I should see "Lewis/Hathaway" within "dd.relationship"
      And I should see "Published:2000-01-10"
      And I should see "Importing Test" within "h2.title" 
      And I should not see "[FIC]" within "h2.title" 
      And I should see "Something I made for testing purposes." within "div.summary"
      And I should see "Yes, this is really only for testing. :)" within "div.notes"
      And I should see "My first paragraph."
      And I should see "My second paragraph."
      And I should not see the "alt" text "Add to memories"
      And I should not see the "alt" text "Next Entry"
      And I should not see "location"
      And I should not see "music"
      And I should not see "mood"
      And I should not see "Entry tags"
      And I should not see "Crossposts"
    When I press "Post"
    Then I should see "Work was successfully posted."
    When I am on cosomeone's user page 
      #'
      Then I should see "Importing Test"

  Scenario: Creating a new work from an DW story that has tables
  # This is to make sure that we don't accidentally strip other tables than
  # DW metadata tables esp. when there's no DW metadata table
  
    Given basic tags
      And a fandom exists with name: "Lewis", canonical: true
      And the following activated user exists
        | login          | password    |
        | cosomeone      | something   |
      And I am logged in as "cosomeone" with password "something"
    When I go to the import page
      And I fill in "urls" with "http://rebecca2525.dreamwidth.org/3601.html"
    When I press "Import"
    Then I should see "Preview Work"
      And I should see "Lewis" within "dd.fandom"
      And I should see "General Audiences" within "dd.rating"
      And I should see "Lewis/Hathaway" within "dd.relationship"
      And I should see "Published:2000-01-10"
      And I should see "Importing Test" within "h2.title" 
      And I should not see "[FIC]" within "h2.title" 
      And I should see "Something I made for testing purposes." within "div.summary"
      And I should see "Yes, this is really only for testing. :)" within "div.notes"
      And I should see "My first paragraph."
      And I should see "My second paragraph."
      And I should not see the "alt" text "Add to memories"
      And I should not see the "alt" text "Next Entry"
      And I should see "My location"
      And I should see "My music"
      And I should see "My mood"
      And I should see "My tags"
    When I press "Post"
    Then I should see "Work was successfully posted."
    When I am on cosomeone's user page 
      #'
      Then I should see "Importing Test"

  
  Scenario: Creating a new work from an DW story without backdating it
    Given basic tags
      And a category exists with name: "Gen", canonical: true
      And a category exists with name: "F/M", canonical: true
      And the following activated user exists
        | login          | password    |
        | cosomeone      | something   |
      And I am logged in as a random user
    When I go to the import page
      And I fill in "urls" with "http://rebecca2525.dreamwidth.org/3506.html"
    When I press "Import"
    Then I should see "Preview Work"
      And I should see "Importing Test"
    When I press "Edit"
    Then I should see "* Required information"
      And I should see "Importing Test"
    When I set the publication date to today
      And I check "No Archive Warnings Apply"
    When I press "Preview"
    Then I should see "Importing Test"
    When I press "Post"
    Then I should see "Work was successfully posted."
      And I should see "Importing Test" within "h2.title" 
      And I should not see the "alt" text "Add to memories!"
      And I should not see the "alt" text "Next Entry"
  

  Scenario: Creating a new work from an DW story that is posted to a community
    Given basic tags
      And the following activated user exists
        | login          | password    |
        | cosomeone      | something   |
      And I am logged in as "cosomeone" with password "something"
    When I go to the import page
      And I fill in "urls" with "http://rarelitfic.dreamwidth.org/5572.html"
    When I press "Import"
    Then I should see "Preview Work"
      And I should see "Poirot - Agatha Christie" within "dd.fandom"
      And I should see "General Audiences" within "dd.rating"
      And I should see "Published:2010-10-23"
      And I should see "Mrs Stanwood's Birthday Party" within "h2.title" 
      And I should not see "[Poirot]" within "h2.title" 
      And I should see "Mrs Stanwood, famous medical researcher" within "div.summary"
      And I should see "more to their friendship than he'd thought." within "div.summary"
      And I should see "Thanks to Tevildo and phantomphan1990 for beta-reading!"
      And I should find "stanwood_title_400.png" within "img[src]"
      And I should see "Follow me to AO3"
      And I should not see "Rare Literature Fanfiction"
      And I should not see "rarelitfic"
      And I should not see "rebecca2525"
      And I should not see the "alt" text "Add to memories"
      And I should not see the "alt" text "Next Entry"
      And I should not see "mood"
      And I should not see "Entry tags"
    When I press "Post"
    Then I should see "Work was successfully posted."
    When I am on cosomeone's user page 
      #'
      Then I should see "Mrs Stanwood's Birthday Party"


  Scenario: Creating a new multichapter work from a DW story
    Given basic tags
      And the following activated user exists
        | login          | password    |
        | cosomeone      | something   |
      And I am logged in as "cosomeone" with password "something"
    When I go to the import page
      And I fill in "urls" with 
         """
         http://rebecca2525.dreamwidth.org/3506.html
         http://rebecca2525.dreamwidth.org/4024.html
         """
      And I choose "import_multiple_chapters"
    When I press "Import"
    Then I should see "Preview Work"
      And I should see "Lewis" within "dd.fandom"
      And I should see "General Audiences" within "dd.rating"
      And I should see "Importing Test" within "h2.title" 
      And I should not see "[FIC]" within "h2.title" 
      And I should see "Something I made for testing purposes." within "div.summary"
      And I should see "Yes, this is really only for testing. :)" within "div.notes"
      And I should see "My first paragraph."
      And I should see "My second paragraph."
    When I press "Post"
    Then I should see "Work was successfully posted."
      And I should see "Chapters:2/2"
      And I should see "Published:2000-01-10"
      And I should see "Completed:2000-01-21"
      And I should see "My first paragraph."
      And I should see "My second paragraph."    
    When I follow "Next Chapter"
    Then I should see "The long awaited second part."
      And I should see "And another paragraph."
      And I should see "The plot thickens." within "div.summary"
      And I should see "MOAR TESTING! :)" within "div.notes"
      And I should see "Importing Test Part 2" within "h3.title" 
    When I am on cosomeone's user page 
      #'
      Then I should see "Importing Test"
