Feature: create and delete movie
 
  As a movie buff
  So that I can manage the list of movies
  I want to be able to create a movie and destroy a movie
 
Background: movies in database
 
  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |
 
Scenario: creating a new movie
  When I am on the RottenPotatoes home page
  And I follow "Add new movie"
  And I fill in "Title" with "The random"
  And I select "PG-13" from "Rating"
  And I select "2020" from "movie_release_date_1i"
  And I select "June" from "movie_release_date_2i"
  And I select "4" from "movie_release_date_3i"
  And I press "Save Changes"
  Then I should see "The random was successfully created."
  And I should see "PG-13"
  And I should see "2020-06-04"
  
Scenario: destroy a movie
  When I am on the details page for "Star Wars"
  And I press "Delete"
  Then I should see "Movie 'Star Wars' deleted."
  And I should not see "1977-05-25"
