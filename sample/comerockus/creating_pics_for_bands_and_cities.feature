Feature: The system creates a picture for Bands and Cities
  In order to connect with the bands and cities through the site
  A Site Visitor
  wants to see a stylized pic of the band or city
  

  Scenario: When a new band is created. It should have a picture
    Given a band "Nine Inch Nails" exists
    Then the band "Nine Inch Nails" should have a picture

  #Scenario: When a new city is created. It should have a picture
  #  Given a city "Orlando" in state "FL" exists
  #  Then the city "Orlando" in state "FL" should have a picture
 

