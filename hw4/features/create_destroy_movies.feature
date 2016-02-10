Feature: create new and delete old database entries
 
  As a movie fan
  So that I can keep the database up-to-date
  I want to add new and delete wrong movies

Background: movies have been added to database

  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

  And  I am on the home page

Scenario: add new Movie
  Given I am on the add a new movie page
  And I fill in "Title" with "Star Wars"
  And I fill in "Director" with "George Lucas"
  And I select "PG" from "Rating"
  And I press "Save Changes"
  Then I should be on the home page
  And I should see "Star Wars was successfully created."

Scenario: delete Movie
  Given I am on the details page for "Aladdin"
  And I press "Delete"
  Then I should be on the home page 
  And I should see "Movie 'Aladdin' deleted."