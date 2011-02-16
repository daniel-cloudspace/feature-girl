@searching @punctuation @fixme
Feature: Search Queries Containing SLASHES  (Stanford)
  In order to get correct search results for queries containing slashes
  As an end user, when I enter a search query with a slash
  I want to see comprehensible search results with awesome relevancy, recall, precision  

  #Physical chemistry / Ira N Levine  (VUF-583) 


4712578, 3016212, 1726910, 7633476, 7871246

  #The Beatles as musicians : Revolver through the Anthology / Walter Everett (VUF-522)
  
  4103922



  Scenario: SLASH no space before or after, 6 add'l terms, 1 stopword: treat hyphenated string as a phrase
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in "q" with "Color-blindness [print/digital]; its dangers and its detection"
    And I press "search"
    Then I should get at least 2 of these ckeys in the first 2 results: "7329437, 2323785"
    And I should get the same number of results as a search for "\"Color blindness\" [print/digital]; its dangers and its detection"

    Scenario: HYPHEN in PHRASE no space before or after, 6 add'l terms, 1 stopword: ignore hyphen
      Given a SOLR index with Stanford MARC data
      When I am on the home page
      And I fill in the search box with "\"Color-blindness [print/digital]; its dangers and its detection\""
      And I press "search"
      Then I should get ckey 7329437 in the first 1 result
      And I should get the same number of results as a search for "\"Color blindness [print/digital]; its dangers and its detection\""


        Scenario: HYPHEN no space before or after, TITLE search, 6 add'l terms, 1 stopword: treat hyphenated string as a phrase
          Given a SOLR index with Stanford MARC data
          When I am on the home page
          And I fill in "q" with "Color-blindness [print/digital]; its dangers and its detection"
          And I select "Title" from "search_field"
          And I press "search"
          Then I should get at least 2 of these ckeys in the first 2 results: "7329437, 2323785"
          And I should get the same number of results as a title search for "\"Color blindness\" [print/digital]; its dangers and its detection"

      # Believe problem is that search can't match across subfields (it sort of works due to all_search)  (SW-94)
        @fixme
        Scenario: HYPHEN in PHRASE no space before or after, TITLE search, 6 add'l terms, 1 stopword: ignore hyphen
          Given a SOLR index with Stanford MARC data
          When I am on the home page
          And I fill in the search box with "\"Color-blindness [print/digital]; its dangers and its detection\""
          And I select "Title" from "search_field"
          And I press "search"
          Then I should get ckey 7329437 in the first 1 result
          And I should get the same number of results as a title search for "\"Color blindness [print/digital]; its dangers and its detection\""


