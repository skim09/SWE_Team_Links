Feature: expand only categories that have been selected
  
  as a social entrepeneur
  so that I can quickly browse links that I am interested in
  I want to only see links in relevant categories
  
Background: links have been added to database
  
  Given the following links exist
  
  | name                | category      | url |
  | Google              | Internships   | https://www.google.com |
  | Acumen              | Inspiration   | https://www.acumen.org |

  And I am on the Links home page

Scenario: finding a link in an expanded category
  When I press "Internships"
  Then I should see "Google"
  And I should be on the Links home page
 
Scenario: not finding a link in an unexpanded category
  When I press "Internships"
  Then I should not see "Acumen"
  And I should be on the Links home page
  