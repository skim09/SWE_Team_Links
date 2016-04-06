Feature: expand only categories that have been selected
  
  as a social entrepeneur
  so that I can quickly browse links that I am interested in
  I want to only see links in relevant categories
  
Background: links in database
  Given the following links exist:
  | name   | url                    | category    |
  | Google | http://google.com      | Internships |
  | Acumen | http://acumen.com      | Inspiration |
  
  And I am on the Links home page
  
Scenario: finding a link in an expanded category
  When I press "Internships"
  Then I should spot "Google"
  And I should be on the Links home page
 
Scenario: not finding a link in an unexpanded category
  When I press "Internships"
  Then I should not spot "Acumen"
  And I should be on the Links home page
  