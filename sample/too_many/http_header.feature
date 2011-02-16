Feature: http://www.unixdaemon.net/ response headers

  Scenario: Server header should be production quality
    When I fetch http://www.unixdaemon.net/
    Then the "Server" header should be "Apache"

  Scenario: Response header should contain an Etag
    When I fetch http://www.unixdaemon.net/
    Then the response should contain the "Etag" header

  Scenario: The Content-Type header should contain text/html
    When I fetch http://www.unixdaemon.net/
    Then the "Content-Type" header should contain "text/html"

  Scenario: The Content-Type header should not contain text/xml
    When I fetch http://www.unixdaemon.net/
    Then the "Content-Type" header should not contain "text/xml"
