Feature: Search twitter by hashtag
  In order to read tweets with a certain hashtag
  As a user
  I should be able to search Twitter

  @javascript
  Scenario: User searches for a hashtag
    When I go to the homepage
    And search for the hashtag "rails"
    Then I should see tweets with the hashtag "#rails"
