Feature: log in via Facebook
  As a Columbia University student
  So that I could easily start using tutorlama without much hassle
  I want to be able to log in using my Facebook account

Scenario: authenticated through Facebook successfully
  Given I am on the home page
  When I click sign in with facebook
  Then I should be on the main page
  And I should see Active Tutor Listings for @Columbia
  And I should see Active Pupil Listings for @Columbia
  And 1 user should exist

@log_in_failure
Scenario: authenticated through Facebook unsuccessfully
  Given I am on the home page
  When I click sign in with facebook
  And I should not see Active Tutor Listings for @Columbia
  And I should not see Active Pupil Listings for @Columbia
  And 0 user should exist
