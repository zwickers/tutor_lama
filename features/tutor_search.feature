Feature: Post Tutor Searches and Tutee Searches
  As a tutor or a tutee,
  So that I can find the tutor/tutee I am looking for
  I want to be able to create a post to search for tutors or tutees

Scenario: Post a tutor search
  Given I am on the home page
  And I am logged in
  When I click Submit New Tutor Search
  And I fill in LOOKING for title
  And I fill in Anybody looking? for text
  And I click button Save changes
  Then I should be on newly created tutor search page
  And I should see LOOKING
  And I should see Anybody looking?
  And 1 tutor search should exist


Scenario: Post a tutee search
  Given I am on the home page
  And I am logged in
  When I click Submit New Pupil Search
  And I fill in LOOKING for title
  And I fill in Anybody looking? for text
  And I click button Save changes
  Then I should be on newly created tutee search page
  And I should see LOOKING
  And I should see Anybody looking?
  And 1 tutee search should exist