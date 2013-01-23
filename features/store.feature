@javascript
Feature: This feature will demonstrate the scenarios of the store maintenance process.
         With scenario we will show the validations to store maintenance.

  Scenario: Create a store with success  	
    When I go to "the stores page"
    Given the following store types exist:
    	| name    |
    	| Food    |
    	| Clothes |
    And I click "New Store"
    And I select "Food" from "store[store_type_id]"
    And I fill in "store[name]" with "Food & Cia"
    And I press "Criar Store"
    Then I should be on "the stores page" do |page_name|
    Then I should see "Store was successfully created."

  Scenario: Create a store without success
    When I go to "the stores page"
    And I click "New Store"
    And I press "Criar Store"
    Then I should see "Name não pode ficar em branco"
    Then I should see "Store type não pode ficar em branco"

  Scenario: Edit a store without success
    Given some stores
    When I go to "the stores page"
    And I click "Edit" at line 2
    And I select "- select -" from "store[store_type_id]"
    And I fill in "store[name]" with ""
    And I press "Atualizar Store"
    Then I should see "Name não pode ficar em branco"
    Then I should see "Store type não pode ficar em branco"

Scenario: Edit a store with success
  Given some stores
  When I go to "the stores page"
  And I click "Edit" at line 2
  And I select "Clothes" from "store[store_type_id]"
  And I fill in "store[name]" with "T-shirt"
  And I press "Atualizar Store"
  Then I should be on "the stores page" do |page_name|
  Then I should see "Store was successfully updated."

Scenario: Delete Store with success
  Given some stores
  When I go to "the stores page"
  Then I should see "Stores (2)"
  Then I should see "Ri Happy"
  And I click "Destroy" at line 2 and confirm destroy
  Then I should not see "Ri Happy"
  Then I should see "Stores (1)"

Scenario: Delete Store with success
  Given some stores
  When I go to "the stores page"
  Then I should see "Stores (2)"
  And I click "Destroy" at line 2 and cancel destroy
  Then I should see "Stores (2)"