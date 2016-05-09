Feature: Sorting Links

Background:
  Given the following users exist:
  | name     | admin         |
  | bmk1995  | true          |
  | hellohihi| false         |
  
  And the user "bmk1995" is logged in
  
  Given the following links exist:
  | name                | category      | url                    | upvotes |
  | Google              | Internships   | https://www.google.com | 6       |
  | Acumen              | Inspiration   | https://www.acumen.org | 5       |
  

Scenario: sorting links by name
  When I am on the Links home page
  When I press "Name"
  Then I should see "Google"