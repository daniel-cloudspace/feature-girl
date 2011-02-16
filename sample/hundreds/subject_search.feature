@searching @subject_search
Feature: Subject Search Results
  In order to get fantastic subject search results
  As an end user, when I do subject searches
  I want to see search results with awesome relevancy, recall, precision
  
  Scenario: Subject links (SW-196)
    Given a SOLR index with Stanford MARC data
    When I am on the show page for "4544375"
    And I follow "Abuse of."
    Then I should not get ckey 7631176 in the results

  Scenario: Quoted individual subjects vs. Quoting the entire subject
    Given a SOLR index with Stanford MARC data
    When I am on the home page
    And I fill in the search box with "\"Older people\" \"Abuse of\""
    Then I select "Subject terms" from "search_field"
    And I press "search"
    Then I should get results
    And I should get more results than a search for "\"Older people Abuse of\""

  Scenario: No cross subject searching
    Given a SOLR index with Stanford MARC data
    When I am on the show page for "8695278"
    And I follow "20th century"
    Then I should not get ckey 3073662 in the results