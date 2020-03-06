Given(/^I am on (.*)$/) do |arg|
  if arg == 'the home page'
    visit('/')
  elsif arg == 'the Active Tutor Searches page'
    visit('/tutor_searches')
  elsif arg == 'the Active Pupil Searches page'
    visit('/tutee_searches')
  end
end

When(/^I click( button)? (.*)$/) do |button, arg|
  if button
    click_button(arg)
  else
    click_link(arg)
  end
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


Given(/^There exists a (.*) Search$/) do |arg|
  visit('/')
  click_link('sign_in')
  if arg == 'Tutor'
    visit('/tutor_searches/new')
  elsif arg == 'Pupil'
    visit('/tutee_searches/new')
  end
  fill_in('title', :with => 'looking for tutor for calc 3')
  fill_in('text', :with => 'welp')
  click_button('commit')
  click_link('sign_out')
end