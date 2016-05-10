require "rack_session_access/capybara"
Given /the following links exist/ do |links_table|
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

Given(/^the admin "(.*)" is logged in$/) do |username|
  page.set_rack_session(user_id: 1)
  page.set_rack_session(authenticated: true)
  page.set_rack_session(admin: true)
end

Given(/^the non-admin "(.*)" is logged in$/) do |username|
  page.set_rack_session(user_id: 2)
  page.set_rack_session(authenticated: true)
  page.set_rack_session(admin: false)
end


Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  tot_bod = page.body
  tot_bod.index(e1).should > tot_bod.index(e2)
end

When /I upvote "(.*)"/ do |e1|
  find("img[alt='upvote']").click
end
