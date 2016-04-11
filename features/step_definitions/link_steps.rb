
Given /the following links exist/ do |links_table|
  links_table.hashes.each do |link|
    Link.create(link)
  end
end