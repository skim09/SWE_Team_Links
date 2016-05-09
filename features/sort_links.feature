Feature: Sorting Links

Background:
  Given the following users exist:
  | name     | admin         |
  | bmk1995  | true          |
  | hellohihi| false         |
  
  And the user "bmk1995" is logged in
  
  And the following links exist:
  | name                | category                         | url                    | upvotes |
  | Google              | 'Get Acclimated & Get Inspired'  | https://www.google.com | 6       |
  | Acumen              | 'Get Acclimated & Get Inspired'  | https://www.acumen.org | 5       |
  

Scenario: sorting links by name
  When I am on the Links home page
  When I press "Name"
  Then I should see "Google"