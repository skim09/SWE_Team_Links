Feature: Sorting Links

Background: links in database
  Given the following links exist:
  | name   | url                    | category    | upvotes |
  | Google | http://google.com      | Internships | 5       |
  | Acumen | http://acumen.com      | Internships | 6       |
  
  And I am on the Links home page

Scenario: sorting links
  When I press "Name"
  Then I should see "Acumen" before "Google"