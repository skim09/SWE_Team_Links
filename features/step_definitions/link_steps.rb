
Given /the following links exist/ do |links_table|
  links_table.hashes.each do |link|
    Link.create(link)
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
    titles = page.all("table#links tbody tr td[1]").map {|t| t.text}
    titles.index(e1).should < titles.index(e2)
end