Given(/^I am on the home page$/) do
  visit('/')
end

When(/^I click( button)? (.*)$/) do |button, arg|
  # puts(page.source)
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
  elsif arg == 'newly created tutor search page'
    expect(url).to eq '/tutor_searches/1'
  elsif arg == 'newly created tutee search page'
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
