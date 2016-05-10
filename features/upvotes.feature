Feature: Upvoting
  
Background:
  
  Given the following links exist:
  | name                | category                        | url                    | upvotes | status | upvoters |
  | Boogle              | Get Acclimated & Get Inspired   | https://www.google.com | 5       | true   |   ;      |
    
  
  Given the following users exist:
  | name        | admin         | email                   | uid |
  | ethbaby     | true          | mjkingsley@wesleyan.edu | 1   |
  | not_ethbaby | false         | ethzorzor@wesleyan.edu  | 2   |
  
  And the admin "ethbaby" is logged in
  And I am on the Links home page

Scenario: upvoting
  Then I should see "Boogle"
  When I follow "upvote"