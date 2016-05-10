Feature: approve or decline links

    as an admin
    so that I can manage the pending links
    I want to be able to approve or decline links

Background: user in database
  
  Given the following links exist:
  | name                | category                        | url                    | upvotes | status |
  | Boogle              | Get Acclimated & Get Inspired   | https://www.google.com | 5       | false  |
  | Acumen              | Get Hired                       | https://www.acumen.org | 5       | false   |
    
  
  Given the following users exist:
  | name        | admin         | email                   | uid |
  | ethbaby     | true          | mjkingsley@wesleyan.edu | 1   |
  | not_ethbaby | false         | ethzorzor@wesleyan.edu  | 2   |
  
  And the admin "ethbaby" is logged in
  And I am on the Links home page

Scenario: pressing notification button
    And I follow "noti"
    Then I should be on the admin page

Scenario: Seeing links to be approved
  When I am on the admin page
  Then I should see "Boogle"
  And I should see "Acumen"
  
Scenario: Pressing back button
  When I am on the admin page
  And I follow "Back"
  Then I should be on the Links home page

Scenario: Non-admin can't access approval page (sad path)
  When the non-admin "not_ethbaby" is logged in
  And I am on the Links home page
  Then I should not see "noti"
  
    