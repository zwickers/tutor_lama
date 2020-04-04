Feature: Submit requests on searches
  As a Tutorlama user
  So that I can respond to the searches and reach out to potential tutor/tutee
  I want to be able to send a request to the OP of a search

  Scenario: Submit a request for a Tutor Search
    Given There exists a Tutor Search
    And I am on the home page
    And I am logged in
    And I am on tutor search post
    When I click button Bid on this pupil...
    And I fill in Hi for title
    And I fill in I can pay big bucks for text
    And I fill in cu@cu.edu for contact
    Then I click button Send bid...

  Scenario: Submit a request for a Tutee Search
    Given There exists a Tutee Search
    And I am on the home page
    And I am logged in
    And I am on tutee search post
    When I fill in Hi I can help you for title
    And I fill in I am well qualified for this for text
    And I fill in lee@cu.edu for contact
    Then I click button Send bid...

  Scenario: Others submit a request to my tutor search
    Given I am on the home page
    And I am logged in
    And I create a Tutor Search
    When other user submit a request on my Tutor Search
    And I click My Profile
    Then I should see I think i can be your tutor
    And I should see [COMS4181]

  Scenario: Others submit a request to my tutee search
    Given I am on the home page
    And I am logged in
    And I create a Tutee Search
    When other user submit a request on my Tutee Search
    And I click My Profile
    Then I should see I need your help
    And I should see [COMS4181]
