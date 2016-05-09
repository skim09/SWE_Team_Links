require "rack_session_access/capybara"
Given /the following links exist/ do |links_table|
  OmniAuth.config.test_mode = true  
  links_table.hashes.each do |link|
    Link.create(link)
  end
end

Given (/the following users exist/) do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    User.create(user)
  #page.refresh
  end
end

Given(/^the user "(.*)" is logged in$/) do |username|
  page.set_rack_session(user_id: 1)
  page.set_rack_session(authenticated: true)
end

