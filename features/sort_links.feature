Feature: Sorting Links

  As a user
  So that I can more easily find useful links
  I want to be able to sort links by name and upvotes
  
Background:
  
  Given the following links exist:
  | name                | category                       | url                    | upvotes | status |
  | Boogle              | Get Acclimated & Get Inspired  | https://www.google.com | 5       | true   |
  | Acumen              | Get Acclimated & Get Inspired  | https://www.acumen.org | 6       | true   |
  
  Given the following users exist:
  | name     | admin         |
  | bmk1995  | true          |
  | hellohihi| false         |
  
  And the admin "bmk1995" is logged in
  And I am on the Links home page
  
Scenario: sorting links by name
  When I press "Name"
  Then I should see "Acumen" before "Boogle"
  
Scenario: sorting links by upvotes
  When I press "Upvotes"
  Then I should see "Acumen" before "Boogle"