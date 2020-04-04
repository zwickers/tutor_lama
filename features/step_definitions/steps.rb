Given(/^I am on (.*)$/) do |arg|
  if arg == 'the home page'
    visit('/')
  elsif arg == 'the Active Tutor Searches page'
    visit('/tutor_searches')
  elsif arg == 'the Active Pupil Searches page'
    visit('/tutee_searches')
  elsif arg == 'tutor search post'
    visit('/tutor_searches/1')
  elsif arg == 'tutee search post'
    visit('/tutee_searches/1')
  end
end

When(/^I click( button)? (.*)$/) do |button, arg|
  if button
    click_button(arg)
  else
    click_link(arg)
  end
end

Then(/^I print$/) do
  puts(page.body)
end

Then(/^I should be on (.*)$/) do |arg|
  url = URI.parse(current_url).path
  if arg == 'the main page'
    expect(url).to eq '/'
  elsif arg == 'newly created tutor search page' or arg == 'tutor search post'
    expect(url).to eq '/tutor_searches/1'
  elsif arg == 'newly created tutee search page' or arg == 'tutee search post'
    expect(url).to eq '/tutee_searches/1'
  end
end

And(/^I should( not)? see (.*)$/) do |not_see, arg|
  if not_see
    expect(page.body =~ /#{arg}/m).to eq nil
  else
    expect(page.body =~ /#{arg}/m).not_to eq nil
  end
end

And(/^(\d+) user should exist$/) do |arg|
  expect(User.count).to be arg
end

And(/^(\d+) tutee search should exist$/) do |arg|
  expect(TuteeSearch.count).to be arg
end

And(/^(\d+) tutor search should exist$/) do |arg|
  expect(TutorSearch.count).to be arg
end

And(/^I am logged in$/) do
  click_link('sign_in')
end

When /^(?:|I )fill in ([^"]*) with ([^"]*)$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )fill in ([^"]*) for ([^"]*)$/ do |value, field|
  fill_in(field, :with => value)
end

Given(/^There exists a ([^"]*) Search/) do | arg |
  User.create()
  Subject.create(name: 'COMS')
  Number.create(name: '4181', subject_id: 1)
  if arg == 'Tutor'
    TutorSearch.create(number_id: 1, user_id: 1, title: 'Security I needs help', text: 'I can pay big bucks')
  elsif arg == 'Tutee'
    TuteeSearch.create(number_id: 1, user_id: 1, title: 'Anyone needs help with Security I?', text: 'I can help')
  end
end

Given(/^I create a ([^"]*) Search/) do | arg |
  Subject.create(name: 'COMS')
  Number.create(name: '4181', subject_id: 1)
  if arg == 'Tutor'
    TutorSearch.create(number_id: 1, user_id: 1, title: 'Security I needs help', text: 'I can pay big bucks')
  elsif arg == 'Tutee'
    TuteeSearch.create(number_id: 1, user_id: 1, title: 'Anyone needs help with Security I?', text: 'I can help')
  end
end

When(/^other user submit a request on my ([^"]*) Search/) do | arg |
  User.create()
  if arg == 'Tutor'
    Request.create(number_id: 1, requester_id: 2, receiver_id: 1, tutor_search_id: 1,
                   title: 'I think i can be your tutor', text: 'I am qualified', contact: '2122222222')
  elsif arg == 'Tutee'
    Request.create(number_id: 1, requester_id: 2, receiver_id: 1, tutee_search_id: 1,
                   title: 'I need your help', text: 'Please I am failing', contact: 'cc@cu.edu')
  end
end
