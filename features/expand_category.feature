Feature: expand only categories that have been selected
  
  as a social entrepeneur
  so that I can quickly browse links that I am interested in
  I want to only see links in relevant categories
  
Background: links in database
  
  Given the following links exist:
  | name                | category                        | url                    | upvotes | status |
  | Boogle              | Get Acclimated & Get Inspired   | https://www.google.com | 5       | true   |
  | Acumen              | Get Hired                       | https://www.acumen.org | 5       | true   |
  
  And I am on the Links home page
  
Scenario: finding a link in an expanded category
  When I press "Get Acclimated & Inspired"
  Then I should see "Boogle"
  And I should be on the Links home page
 
Scenario: not finding a link in an unexpanded category
  When I press "Get Acclimated & Inspired"
  Then I should not see "Acumen"
  And I should be on the Links home page
  