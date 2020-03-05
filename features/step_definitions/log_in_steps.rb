Given(/^I am on the home page$/) do
  visit('/')
end

When(/^I click sign in with facebook$/) do
  click_link('sign_in')
end

Then(/^I should be on the main page$/) do
  url = URI.parse(current_url).path
  expect(url).to eq '/'
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