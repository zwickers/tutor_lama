Feature: Comment on a Search Post
  As a Tutorlama user
  So that I can inquire about someone’s post
  I want to be able to add a comment to a tutor/pupil search

Scenario: leaving a comment on a tutor search
  Given There exists a Tutor Search
  And I am logged in
  And I am on the Active Tutor Searches page
  When I click Show
  And I click Add Comment
  And I fill in Great! for comment_text[text]
  And I click button Submit Comment
  Then I should be on tutor search post
  And I should see Great!

Scenario: leaving a comment on a pupil search
  Given There exists a Pupil Search
  And I am logged in
  And I am on the Active Pupil Searches page
  When I click Show
  And I click Add Comment
  And I fill in what time can you make it for comment_text[text]
  And I click button Submit Comment
  Then I should be on tutee search post
  And I should see what time can you make it