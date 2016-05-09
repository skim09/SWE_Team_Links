Feature: Admin approval

Background:
  Given the following users exist:
  | name     | admin         |
  | bmk1995  | true          |
  | hellohihi| false         |
  
  And the user "bmk1995" is logged in
  And I am on the Links home page

Scenario:
  When I follow "noti"
  Then I should see "Link Approval"