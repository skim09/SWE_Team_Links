
Given /the following links exist/ do |links_table|
  links_table.hashes.each do |link|
    Link.create(link)
  end
end

Given /the following user exists/ do |users_table|
  users_table.hashes.each do |user|
    User.create(user)
  end
end