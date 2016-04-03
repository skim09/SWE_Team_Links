Feature: expand only categories that have been selected
  
  as a social entrepeneur
  so that I can quickly browse links that I am interested in
  I want to only see links in relevant categories
  
Background: links have been added to database
  
  Given the following links exist
  
  | name            | url           | upvotes       | category      |
  | Google          | google.com    | 5             | Internships   |
  | Yahoo           | yahoo.com     | 4             | Jobs          |
  | Bing            | bing.com      | 6             | Grants        |

  And I am on the Links home page

Scenario: finding a link in an expanded category
  When I press "Jobs"
  Then I should see "Link1"
  And I should be on the Links home page
 
Scenario: not finding a link in an unexpanded category
  When I press "Jobs"
  Then I should not see "Link2"
  And I should be on the Links home page
  