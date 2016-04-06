Feature: expand only categories that have been selected
  
  as a social entrepeneur
  so that I can quickly browse links that I am interested in
  I want to only see links in relevant categories
  
Background: links have been added to database
  
  Given the following links exist:
  | name     | category          | url          | 
  | Google   | Internships       | google.com   |


  And I am on the Links home page

Scenario: finding a link in an expanded category
  When I expand "Internships"
  Then I should see "Google"
  And I should be on the Links home page
 
Scenario: not finding a link in an unexpanded category
  When I expand "Internships"
  Then I should not see "Acumen"
  And I should be on the Links home page
  