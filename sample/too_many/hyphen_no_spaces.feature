@searching @punctuation @hyphen
Feature: Search Queries Containing Hyphens Between Chars (No Spaces)
  I want search queries with hyphens between characters (no spaces) to return results with awesome relevancy, recall, and precision

  Scenario: HYPHEN (SW-388) search for: prisoner in a red-rose chain
    Given a SOLR index with Stanford MARC data
    When I go to the home page
    When I fill in "q" with "prisoner in a red-rose chain"
    And I press "search"
    Then I should get ckey 8702148 in the results
    And I should get the same number of results as a search for "prisoner in a red rose chain"

  Scenario: HYPHEN (SW-388) title search for: prisoner in a red-rose chain
    Given a SOLR index with Stanford MARC data
    When I go to the home page
    When I fill in "q" with "prisoner in a red-rose chain"
    And I select "Title" from "search_field"
    And I press "search"
    Then I should get ckey 8702148 in the first 1 results
    And I should get the same number of results as a title search for "prisoner in a red rose chain"
 
  Scenario: HYPHEN (SW-388) search for: red-rose chain
    Given a SOLR index with Stanford MARC data
    When I go to the home page
    When I fill in "q" with "red-rose chain"
    And I press "search"
    Then I should get at least 2 of these ckeys in the first 2 results: "5335304, 8702148"
    And I should get fewer results than a search for "red rose chain"

  Scenario: HYPHEN (SW-388) title search for: red-rose chain
    Given a SOLR index with Stanford MARC data
    When I go to the home page
    When I fill in "q" with "red-rose chain"
    And I select "Title" from "search_field"
    And I press "search"
    Then I should get at least 2 of these ckeys in the first 2 results: "5335304, 8702148"
    And I should get the same number of results as a title search for "red rose chain"

 
  Scenario: HYPHEN no space before or after, 0 add'l terms: treat hyphenated string as a phrase
    Given a SOLR index with Stanford MARC data
    And I go to the home page
    When I fill in "q" with "cat-dog"
    And I press "search"
    Then I should get ckey 6741004 in the results
    And I should get the same number of results as a search for "\"cat dog\""

  Scenario: HYPHEN within numbers, no space before or after, not-ISSN: treat hyphenated string as a phrase
    Given a SOLR index with Stanford MARC data
    When I go to the home page
    And I fill in "q" with "1951-1960"
    And I press "search"
    Then I should get ckey 2916430 in the results
# 2010-09-05  1951-1960 gets 1859,   "1951 1960"  gets 1844  
    And I should get at least 1850 total results
    And I should get the same number of results as a search for "\"1951 1960\""

  Scenario: HYPHEN within numbers, ISSN
    Given a SOLR index with Stanford MARC data
    And I go to the home page
    When I fill in "q" with "0256-1115"
    And I press "search"
    Then I should get ckey 4108257 in the first 1 result
    
  Scenario: HYPHEN no space before or after, 0 add'l terms: treat hyphenated string as a phrase (VUF-798)
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in "q" with "neo-romantic"
    And I press "search"
    Then I should get at least 7 of these ckeys in the first 12 results: "7789846, 2095712, 7916667, 5627730, 1665493, 2775888, 1688481"
    And I should get the same number of results as a search for "\"neo romantic\""


  Scenario: HYPHEN no space before or after, 1 add'l term: treat hyphenated string as a phrase (VUF-803)
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in "q" with "Deutsch-Sudwestafrikanische Zeitung"
    And I press "search"
    Then I should get at least 2 of these ckeys in the first 2 results: "410366, 8230044"
    And I should get the same number of results as a search for "\"Deutsch Sudwestafrikanische\" Zeitung"

  Scenario: HYPHEN in PHRASE no space before or after, 1 add'l term: ignore hyphen
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in the search box with "\"Deutsch-Sudwestafrikanische Zeitung\""
    And I press "search"
    Then I should get at least 2 of these ckeys in the first 2 results: "410366, 8230044"
    And I should get the same number of results as a search for "\"Deutsch Sudwestafrikanische Zeitung\""


  Scenario: HYPHEN no space before or after, 1 stopword, 1 add'l term: treat hyphenated string as a phrase (VUF-966)
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in "q" with "under the sea-wind"
    And I press "search"
    Then I should get at least 3 of these ckeys in the first 3 results: "5621261, 545419, 2167813"
    And I should get the same number of results as a search for "under the \"sea wind\""

  Scenario: HYPHEN in PHRASE no space before or after, 1 stopword, 1 add'l term: ignore hyphen
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in the search box with "\"under the sea-wind\""
    And I press "search"
    Then I should get at least 3 of these ckeys in the first 3 results: "5621261, 545419, 2167813"
    And I should get the same number of results as a search for "\"under the sea wind\""


  Scenario: HYPHEN no space before or after, 2 add'l terms, 0 stopwords: treat hyphenated string as a phrase (SW-288)
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in "q" with "customer-driven academic library"
    And I press "search"
    Then I should get ckey 7778647 in the first 1 result
    And I should get the same number of results as a search for "\"customer driven\" academic library"

  Scenario: HYPHEN in PHRASE no space before or after, 2 add'l terms, 0 stopwords: ignore hyphen
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in the search box with "\"customer-driven academic library\""
    And I press "search"
    Then I should get ckey 7778647 in the first 1 result
    And I should get the same number of results as a search for "\"customer driven academic library\""


  Scenario: HYPHEN no space before or after, 2 add'l terms, 1 stopword: treat hyphenated string as a phrase (VUF-846)
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in "q" with "catalogue of high-energy accelerators"
    And I press "search"
    Then I should get ckey 1156871 in the first 1 result
    And I should get the same number of results as a search for "catalogue of \"high energy\" accelerators"

  Scenario: HYPHEN in PHRASE no space before or after, 2 add'l terms, 1 stopword: ignore hyphen
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in the search box with "\"catalogue of high-energy accelerators\""
    And I press "search"
    Then I should get ckey 1156871 in the first 1 result
    And I should get the same number of results as a search for "\"catalogue of high energy accelerators\""


  Scenario: HYPHEN no space before or after, 3 add'l terms, 0 stopwords: treat hyphenated string as a phrase
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in "q" with "Mid-term fiscal policy review"
    And I press "search"
    Then I should get at least 2 of these ckeys in the first 3 results: "7204125, 5815422"
    And I should get the same number of results as a search for "\"Mid term\" fiscal policy review"

  Scenario: HYPHEN in PHRASE no space before or after, 3 add'l terms, 0 stopwords: ignore hyphen
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in the search box with "\"Mid-term fiscal policy review\""
    And I press "search"
    Then I should get at least 2 of these ckeys in the first 3 results: "7204125, 5815422"
    And I should get the same number of results as a search for "\"Mid term fiscal policy review\""


  Scenario: HYPHEN no space before or after, 3 add'l terms, 1 stopword: treat hyphenated string as a phrase
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in "q" with "The third plan mid-term appraisal"
    And I press "search"
    Then I should get ckey 2234698 in the first 1 result
    And I should get the same number of results as a search for "the third plan \"mid term\" appraisal"

  Scenario: HYPHEN in PHRASE no space before or after, 3 add'l terms, 1 stopword: ignore hyphen
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in the search box with "\"The third plan mid-term appraisal\""
    And I press "search"
    Then I should get ckey 2234698 in the first 1 result
    And I should get the same number of results as a search for "\"the third plan mid term appraisal\""


  Scenario: HYPHEN no space before or after, 6 add'l terms, 1 stopword: treat hyphenated string as a phrase
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



  Scenario: HYPHEN no space before or after, TITLE search, 0 add'l terms: treat hyphenated string as a phrase (VUF-798)
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in "q" with "neo-romantic"
    And I select "Title" from "search_field"
    And I press "search"
    Then I should get at least 7 of these ckeys in the first 12 results: "7789846, 2095712, 7916667, 5627730, 1665493, 2775888, 1688481"
    And I should get the same number of results as a title search for "\"neo romantic\""

  Scenario: HYPHEN within numbers, no space before or after, TITLE search:  treat hyphenated string as a phrase
    Given a SOLR index with Stanford MARC data
    And I go to the home page
    When I fill in "q" with "1951-1960"
    And I select "Title" from "search_field"
    And I press "search"
    Then I should get ckey 2916430 in the results
    And I should get the same number of results as a title search for "\"1951 1960\""


  Scenario: HYPHEN no space before or after, TITLE search, 1 add'l term: treat hyphenated string as a phrase (VUF-803)
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in "q" with "Deutsch-Sudwestafrikanische Zeitung"
    And I select "Title" from "search_field"
    And I press "search"
    Then I should get at least 2 of these ckeys in the first 2 results: "410366, 8230044"
    And I should get the same number of results as a title search for "\"Deutsch Sudwestafrikanische\" Zeitung"

  Scenario: HYPHEN in PHRASE no space before or after, TITLE search, 1 add'l term: ignore hyphen
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in the search box with "\"Deutsch-Sudwestafrikanische Zeitung\""
    And I select "Title" from "search_field"
    And I press "search"
    Then I should get at least 2 of these ckeys in the first 2 results: "410366, 8230044"
    And I should get the same number of results as a title search for "\"Deutsch Sudwestafrikanische Zeitung\""


  Scenario: HYPHEN no space before or after, TITLE search, 1 stopword, 1 add'l term: treat hyphenated string as a phrase (VUF-966)
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in "q" with "under the sea-wind"
    And I select "Title" from "search_field"
    And I press "search"
    Then I should get at least 3 of these ckeys in the first 3 results: "5621261, 545419, 2167813"
    And I should get the same number of results as a title search for "under the \"sea wind\""

  Scenario: HYPHEN in PHRASE no space before or after, TITLE search, 1 stopword, 1 add'l term: ignore hyphen
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in the search box with "\"under the sea-wind\""
    And I select "Title" from "search_field"
    And I press "search"
    Then I should get at least 3 of these ckeys in the first 3 results: "5621261, 545419, 2167813"
    And I should get the same number of results as a title search for "\"under the sea wind\""


  Scenario: HYPHEN no space before or after, TITLE search, 2 add'l terms, 0 stopwords: treat hyphenated string as a phrase (SW-288)
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in "q" with "customer-driven academic library"
    And I select "Title" from "search_field"
    And I press "search"
    Then I should get ckey 7778647 in the first 1 result
    And I should get the same number of results as a title search for "\"customer driven\" academic library"

  Scenario: HYPHEN in PHRASE no space before or after, TITLE search, 2 add'l terms, 0 stopwords: ignore hyphen
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in the search box with "\"customer-driven academic library\""
    And I select "Title" from "search_field"
    And I press "search"
    Then I should get ckey 7778647 in the first 1 result
    And I should get the same number of results as a title search for "\"customer driven academic library\""


  Scenario: HYPHEN no space before or after, TITLE search, 2 add'l terms, 1 stopword: treat hyphenated string as a phrase (VUF-846)
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in "q" with "catalogue of high-energy accelerators"
    And I select "Title" from "search_field"
    And I press "search"
    Then I should get ckey 1156871 in the first 1 result
    And I should get the same number of results as a title search for "catalogue of \"high energy\" accelerators"

  Scenario: HYPHEN in PHRASE no space before or after, TITLE search, 2 add'l terms, 1 stopword: ignore hyphen
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in the search box with "\"catalogue of high-energy accelerators\""
    And I select "Title" from "search_field"
    And I press "search"
    Then I should get ckey 1156871 in the first 1 result
    And I should get the same number of results as a title search for "\"catalogue of high energy accelerators\""



  Scenario: HYPHEN no space before or after, TITLE search, 3 add'l terms, 0 stopwords: treat hyphenated string as a phrase
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in "q" with "Mid-term fiscal policy review"
    And I select "Title" from "search_field"
    And I press "search"
    Then I should get at least 2 of these ckeys in the first 3 results: "7204125, 5815422"
    And I should get the same number of results as a title search for "\"Mid term\" fiscal policy review"
    
  Scenario: HYPHEN in PHRASE no space before or after, TITLE search, 3 add'l terms, 0 stopwords: ignore hyphen
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in the search box with "\"Mid-term fiscal policy review\""
    And I select "Title" from "search_field"
    And I press "search"
    Then I should get at least 2 of these ckeys in the first 3 results: "7204125, 5815422"
    And I should get the same number of results as a title search for "\"Mid term fiscal policy review\""
    

  Scenario: HYPHEN no space before or after, TITLE search, 3 add'l terms, 1 stopword: treat hyphenated string as a phrase
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in "q" with "The third plan mid-term appraisal"
    And I select "Title" from "search_field"
    And I press "search"
    Then I should get ckey 2234698 in the first 1 result
    And I should get the same number of results as a title search for "The Third plan \"mid term\" appraisal"

  Scenario: HYPHEN in PHRASE no space before or after, TITLE search, 3 add'l terms, 1 stopword: ignore hyphen
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in the search box with "\"The third plan mid-term appraisal\""
    And I select "Title" from "search_field"
    And I press "search"
    Then I should get ckey 2234698 in the first 1 result
    And I should get the same number of results as a title search for "\"the third plan mid term appraisal\""


  Scenario: HYPHEN no space before or after, TITLE search, 6 add'l terms, 1 stopword: treat hyphenated string as a phrase
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in "q" with "Color-blindness [print/digital]; its dangers and its detection"
    And I select "Title" from "search_field"
    And I press "search"
    Then I should get at least 2 of these ckeys in the first 2 results: "7329437, 2323785"
    And I should get the same number of results as a title search for "\"Color blindness\" [print/digital]; its dangers and its detection"
    
  # the scenario above won't work as a phrase search because we don't include 245h in title_245_search, and 245h contains "[print/digital]"    
