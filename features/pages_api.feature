Feature: Pages API
  Scenario: List pages
    Given I send and accept JSON
    And page exists with title: "Homepage", content: "My awesome page"
    When I send GET request to "/api/pages"
    Then the response status should be "200"
    And the response body should contain "page" object with fields:
      | title    | content         |
      | Homepage | My awesome page |
      
  Scenario: Show page
    Given I send and accept JSON
    And page exists with id: 1, title: "Homepage", content: "My awesome page"
    When I send GET request to "/api/pages/1"
    Then the response status should be "200"
    And the response body should contain "page" object with fields:
      | title    | content         |
      | Homepage | My awesome page |
      
  Scenario: Create page
    Given I send and accept JSON
    When I send POST request to "/api/pages" with the following:
      """
      {
        "page": {
          "title": "New page",
          "content": "new page content"
        }
      }
      """
    Then the response status should be "201"
    And the response body should contain "page" object with fields:
      | title    | content          |
      | New page | new page content |
      
  Scenario: Update page
    Given I send and accept JSON
    And page exists with id: 1, title: "Homepage", content: "My awesome page"
    When I send PUT request to "/api/pages/1" with the following:
      """
      {
        "id": 1,
        "page": {
          "title": "Homepage title(updated)",
          "content": "Updated homepage content"
        }
      }
      """
    Then the response status should be "204"
    
  Scenario: Delete page
    Given I send and accept JSON
    And page exists with id: 1, title: "Homepage", content: "My awesome page"
    When I send DELETE request to "/api/pages/1"
    Then the response status should be "204"
