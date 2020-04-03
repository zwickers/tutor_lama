Feature: Comment on a Search Post
  As a Tutorlama user
  So that I can inquire about someone’s post
  I want to be able to add a comment to a tutor/pupil search

Scenario: leaving a comment on a tutor search
  Given I am on the home page
  And I am logged in
  And I am on the home page
  And I click SUBJECTS
  And I fill in COMS for name
  And I click button Submit
  And I should see COMS
  And I fill in 4118 for name
  And I click button Submit
  And I click button Submit New Tutor Search
  And I fill in LOOKING for title
  And I fill in Anybody looking? for text
  And I click button Save changes
  When I click button Add Comment
  And I fill in Great! for comment_text[text]
  And I click button Submit Comment
  Then I should be on tutor search post
  And I should see Great!

Scenario: leaving a comment on a pupil search
  Given I am on the home page
  And I am logged in
  And I am on the home page
  And I click SUBJECTS
  And I fill in COMS for name
  And I click button Submit
  And I should see COMS
  And I fill in 4118 for name
  And I click button Submit
  And I click button Submit New Pupil Search
  And I fill in LOOKING for title
  And I fill in Anybody looking? for text
  And I click button Save changes
  When I click button Add Comment
  And I fill in what time can you make it for comment_text[text]
  And I click button Submit Comment
  Then I should be on tutee search post
  And I should see what time can you make it