Feature: Search twitter
  In order to find out about what people are talking about on Twitter
  As a guest
  I should be able to search Twitter

  Scenario: Search Twitter
    When I search for the hashtag "rails"
    Then I should see tweets containing the hashtag "rails"
