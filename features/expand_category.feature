Feature: expand only categories that have been selected
  
  as a social entrepeneur
  so that I can quickly browse links that I am interested in
  I want to only see links in relevant categories
  
Background: links have been added to database
  
  Given the following links exist
  
  | name                | url                                     | upvotes       | category      |
  | BridgeSpan          | www.bridgespan.org/Nonprofit_Jobs.aspx  | 5             | Jobs          |
  | Idealist            | www.idealist.org                        | 4             | Jobs          |
  | Barr Foundation     | www.barrfoundation.org/grantmaking      | 6             | Grants        |

  And I am on the Links home page

Scenario: finding a link in an expanded category
  When I expand "Jobs"
  Then I should see "BridgeSpan"
  And I should see "Idealist"
  And I should be on the Links home page
 
Scenario: not finding a link in an unexpanded category
  When I expand "Jobs"
  Then I should not see "Barr Foundation"
  And I should be on the Links home page
  