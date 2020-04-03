Feature: log in via Facebook
  As a Columbia University student
  So that I could easily start using tutorlama without much hassle
  I want to be able to log in using my Facebook account

Scenario: authenticated through Facebook successfully
  Given I am on the home page
  When I click sign_in
  Then I should be on the main page
  And I should see Tutor Searches for @Columbia
  And I should see Pupil Searches for @Columbia
  And 1 user should exist

@log_in_failure
Scenario: authenticated through Facebook unsuccessfully
  Given I am on the home page
  When I click sign_in
  And I should not see Tutor Searches for @Columbia
  And I should not see Pupil Searches for @Columbia
  And 0 user should exist
