Feature: Oakland Fruit Search

  Background:
    Given user is on fruit search page

  Scenario: Verify the user can search for the fruits
    When user search for the fruit Rose
    Then user should see the results related to Rose
    And verify the search results count is not more than 10

  Scenario Outline: Verify the user can search for different fruits
    When user search for the fruit <fruit_name>
    Then user should see the results related to <fruit_name>
    And verify the search results count is not more than <no_of_results>
    Examples:
      | fruit_name | no_of_results |
      | Rose       | 10            |
      | Sunflower  | 10            |

  Scenario Outline: Verify the user can search for different fruits with details
    When user search for the fruit <fruit_name>
    Then user should see the results related to <fruit_name>
    And verify the search results count is not more than <no_of_results>
    And verify the header details of the fruit
      | fruit_details |
      | fruit Type    |
      | fruit Height  |
      | Flower Height |
      | Spread        |
      | Sunlight      |
    Examples:
      | fruit_name | no_of_results |
      | Rose       | 10            |
      | Sunflower  | 10            |


  Scenario: Verify user can add the fruits to wish list
    When user search for the fruit Rose
    And user add the first result to the wish list
    Then verify the added fruit is showing under wish list page
#    Then verify the Chater's Double Rose Pink Hollyhock fruit is showing under wish list page

  Scenario: Verify user can modify the item quantity in the wish list
    When user search for the fruit Rose
    And user add the first result to the wish list
    And user modifies the quantity of the wish list item
    Then verify user can see the updated quantity

#    Imperative style
  Scenario: Verify user can modify the item quantity in the wish list using imperative style
    Then user can modify the quantity in the wish list

  Scenario: verify the user can empty the wish list
    When user adds the fruit Rose to the wish list
    And user empty the wish list
    Then user should see the confirmation message "Your Wish List is currently empty!"

  Scenario: Get the fruit search details - fruit Type, fruit Height, Flower Height, Spread and Sunlight
    When user search for the fruit Rose
    Then user should see the results related to Rose
    And get the details of the fruit

  Scenario: Verify the fruit search details - fruit Type, fruit Height, Flower Height, Spread and Sunlight are correct
    When user search for the fruit Rose
    Then user should see the results related to Rose
    And verify the details of the fruit
      | fruit_details | fruit_value |
      | fruit Type    | perennial   |
      | fruit Height  | 4 feet      |
      | Flower Height | 6 feet      |
      | Spread        | 24 inches   |
      | Sunlight      | full sun    |

