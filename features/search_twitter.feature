Feature: Search twitter by hashtag
  In order to read tweets with a certain hashtag
  As a user
  I should be able to search Twitter

  @javascript
  Scenario: User searches for a hashtag
    When I search for the hashtag "rails"
    Then I should see tweets with the hashtag "#rails"

  @javascript
  Scenario: User views metadata for each tweet
    Given Twitter returns the following tweets for the search term "#rails":
      | text                         |
      | I love #rails                |
      | Thoughtbot is awesome #rails |
      | nyc > boston #rails          |
    When I search for the hashtag "rails"
    Then I should see 3 tweets
