
Given /the following links exist/ do |links_table|
  links_table.hashes.each do |link|
    Link.create(link)
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  tot_bod = page.body
  tot_bod.index(e1).should > tot_bod.index(e2)
end