Feature: Create course page and view course's searches
  As a Tutorlama user
  So that I can post searches associated with a specific course
  I want to be able to use create

  Scenario: creating a subject
    Given I am on the home page
    And I am logged in
    And I am on the home page
    When I click SUBJECTS
    And I fill in CHEM for name
    And I click button Submit
    And I should see CHEM

  Scenario: creating a subject and a course number
    Given I am on the home page
    And I am logged in
    And I am on the home page
    When I click SUBJECTS
    And I fill in COMS for name
    And I click button Submit
    And I should see COMS
    And I fill in 4118 for name
    And I click button Submit
    Then I should see COMS
    And I should see 4118
    And I should see Submit New Tutor Search
    And I should see Submit New Pupil Search
