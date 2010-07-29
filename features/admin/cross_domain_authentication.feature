@site_up
@another_site_up
@authenticated
Feature:
  In order to manage a new site I created
  As an administrator signed in another site of mine
  I want to bypass the authentication

Scenario: Successful authentication
  When I go to pages
  Then I should see "Locomotive test website"
  When I select "Locomotive test website #2" from "target_id"
  And I press "Switch"
  Then I should see "Cross-domain authentication"
  When I press "Go"
  Then I should see "Locomotive test website #2"

Scenario: Failed authentication because of an outdated token
  When I go to pages
  And I select "Locomotive test website #2" from "target_id"
  And I press "Switch"
  And I forget to press the button on the cross-domain notice page
  And I press "Go"
  Then I should see "You need to sign in"