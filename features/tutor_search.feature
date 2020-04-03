Feature: Post Tutor Searches and Tutee Searches
  As a tutor or a tutee,
  So that I can find the tutor/tutee I am looking for
  I want to be able to create a post to search for tutors or tutees

  Scenario: Post a tutor search on COMS 4118
    Given I am on the home page
    And I am logged in
    And I am on the home page
    And I click SUBJECTS
    And I fill in COMS for name
    And I click button Submit
    And I should see COMS
    And I fill in 4118 for name
    And I click button Submit
    When I click button Submit New Tutor Search
    And I fill in LOOKING FOR TUTOR for title
    And I fill in Anybody looking? for text
    And I click button Save changes
    Then I should be on newly created tutor search page
    And I should see LOOKING FOR TUTOR
    And I should see Anybody looking?
    And I should see This is your post
    And 1 tutor search should exist
    And I click My Profile
    And I should see LOOKING FOR TUTOR
    And I should see [COMS4118]

  Scenario: Post a tutee search on COMS 4118
    Given I am on the home page
    And I am logged in
    And I am on the home page
    And I click SUBJECTS
    And I fill in COMS for name
    And I click button Submit
    And I should see COMS
    And I fill in 4118 for name
    And I click button Submit
    When I click button Submit New Pupil Search
    And I fill in I AM A GENIUS for title
    And I fill in I can guarantee an A for you in OS for text
    And I click button Save changes
    Then I should be on newly created tutee search page
    And I should see I AM A GENIUS
    And I should see I can guarantee an A for you in OS
    And I should see This is your post
    And 1 tutee search should exist
    And I click My Profile
    And I should see I AM A GENIUS
    And I should see [COMS4118]