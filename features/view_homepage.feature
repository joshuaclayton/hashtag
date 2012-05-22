Feature: View the homepage
  In order to find out what people are tweeting about an individual term
  As a user
  I should be able to enter a search term

  Scenario: User can search for a term
    When I go to the homepage
    Then I should be able to enter a search term for Twitter
