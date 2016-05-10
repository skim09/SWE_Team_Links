Feature: Upvoting
  
Background:
  
  Given the following links exist:
  | name                | category                        | url                    | upvotes | status |
  | Boogle              | Get Acclimated & Get Inspired   | https://www.google.com | 5       | true   |
    
  
  Given the following users exist:
  | name        | admin         | email                   | uid |
  | ethbaby     | true          | mjkingsley@wesleyan.edu | 1   |
  | not_ethbaby | false         | ethzorzor@wesleyan.edu  | 2   |
  
  And the non-admin "not_ethbaby" is logged in
  And I am on the Links home page

Scenario: upvoting
  When I upvote "Boogle"