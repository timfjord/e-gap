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
    
  Scenario: Published pages
    Given I send and accept JSON
    And the following pages exist
      | title            | content             | published_on    |
      | Published page   | Published content   | 2013-8-10 5:5:5 |
      | Unpublished page | Unpublished content |                 |

    When I send GET request to "/api/pages/published"
    Then the response status should be "200"
    And the response body should contain "page" object with fields:
      | title          | content           |
      | Published page | Published content |
    And the response body should not contain "page" object with fields:
      | title            | content             |
      | Unpublished page | Unpublished content |
      
  Scenario: Unpublished pages
    Given I send and accept JSON
    And the following pages exist
      | title            | content             | published_on    |
      | Published page   | Published content   | 2013-8-10 5:5:5 |
      | Unpublished page | Unpublished content |                 |
    When I send GET request to "/api/pages/unpublished"
    Then the response status should be "200"
    And the response body should contain "page" object with fields:
      | title            | content             |
      | Unpublished page | Unpublished content |
    And the response body should not contain "page" object with fields:
      | title          | content           |
      | Published page | Published content |

  Scenario: Publish page
    Given I send and accept JSON
    And page exists with id: 1, title: "Homepage", content: "My awesome page"
    When I send POST request to "/api/pages/1/publish"
    Then the response status should be "201"
    And the response body should contain "page" object with not nil field "published_on"
    
  Scenario: Unpublish page
    Given I send and accept JSON
    And page exists with id: 1, title: "Homepage", content: "My awesome page"
    When I send POST request to "/api/pages/1/unpublish"
    Then the response status should be "201"
    And the response body should contain "page" object with nil field "published_on"
    
  Scenario: Page total words
    Given I send and accept JSON
    And page exists with id: 1, title: "Word1", content: "Word2 Word3 Word4"
    When I send GET request to "/api/pages/1/total_words"
    Then the response status should be "200"
    And the response body should contain
    """
    4
    """