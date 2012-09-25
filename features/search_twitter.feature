Feature: Search twitter
  In order to find out about what people are talking about on Twitter
  As a guest
  I should be able to search Twitter

  Scenario: Search Twitter
    When I search for the hashtag "rails"
    Then I should see tweets containing the hashtag "rails"

  @wip
  Scenario: Search Twitter with known results
    Given Twitter returns the following results when searching for "#ruby":
      | text                 | from_user_name |
      | I love #ruby         | joshuaclayton  |
      | #ruby rocks my world | jdowd          |
    When I search for the hashtag "ruby"
    Then I should see 2 tweets containing the hashtag "ruby"
    When I search for the hashtag "rails"
    Then I should see 0 tweets
