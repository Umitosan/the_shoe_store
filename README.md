# _The Shoe Store_

#### _A web application designed to help manage multiple shoe store locations and their inventory.
May 12, 2017_

#### By _**Dominic Brown**_

## Description

This web app aids in the managment of multiple shoes stores, including the many brands, prices and separate inventories of each store.

### Prerequisites

* Web browser with ES6 compatibility (any modern up-to-date browser: Chrome, Firefox, Safari)
* Ruby
* Bundler

## User stories

* As a user, I want to be able to add, update, delete and list shoe stores.
* As a user, I want to be able to add and list new shoe brands. Shoe brands should include price.
* As a user, I want to be able to add shoe brands in the application (don't worry about updating, listing or  destroying shoe brands).
* As a user, I want to be able to add existing shoe brands to a store to show where they are sold.
* As a user, I want to be able to associate the same brand of shoes with multiple stores.
* As a user, I want to be able to see all of the brands a store sells on the individual store page.
* As a user, I want store names and shoe brands to be saved with a capital letter no matter how I enter them.
* As a user, I want the price to be in currency format even if I just inputted a number. (In other words,  typing in 50 should be updated to $50.00.)
* As a user, I do not want stores and/or shoe brands to be saved if I enter a blank name.
* As a user, I want all stores and brands to be unique. There shouldn't be two entries in the database for  Blundstone.
* As a user, I want store and brand names to have a maximum of one hundred characters.

## Specifications
| Behavior |  Input   |  Output  |
|----------|:--------:|:--------:|
| the program will allow the user to view all store locations on the main page | user visits home page | the list of all current shoe stores is visible |
| the program will allow the user to add store locations on the main page | user enters a name into an input field and clicks a button | the new shoe store location appears in the list of locations on the page |
||||
| the program will allow the user to manage each store location on a separate page | the user clicks a store location link | a new page appears with that location's management interface |
| the program will allow the user to delete or rename the store location name from that store's page | user clicks a delete button | the store is removed from the database and the home page is shown |
| the program will allow the user to add shoe brands to a location | on a store page, the user clicks checkboxes next to shoe brands and clicks a button | the shoe brands are added to the list of brands for that store location |
||||
| the program will allow the user to view the list of all shoe brands | user clicks a link on the main page | a new page appears with all shoes brands listed |
| the program will allow the user to manage the list of shoe brands | the user inputs a name into an input field and clicks a button, or the user clicks a delete link next to a shoe brand | the shoe brand page reflects the intended change |

## Setup/Installation Requirements

* _Set up a production database and a development database in SQL (see instructions below)_
* _In another terminal window, clone this repository to your machine and navigate to the file path in your terminal._
* _github link for cloning: https://github.com/Umitosan/the_shoe_store.git
* _Run $bundle_
* _Run $ruby app.rb_
* _Type localhost:4567 in a browser window to view application_

## Database Setup Instructions

* _If Postgres is not installed on your computer, follow these instructions https://www.learnhowtoprogram.com/ruby/ruby-database-basics/installing-postgres-7fb0cff7-a0f5-4b61-a0db-8a928b9f67ef_
* _run ```$ postgres``` in your terminal window and leave it running_
* _In another terminal window, run ```$ psql```_
* _Type the following:_
* _CREATE DATABASE shoe_store;_
* _\c shoe_store_
* _CREATE TABLE stores (id serial PRIMARY KEY, name text);_
* _CREATE TABLE inventories (id serial PRIMARY KEY, name text, time timestamp);_
* _CREATE TABLE brands (id serial PRIMARY KEY, name text, price decimal);_
* _CREATE DATABASE shoe_store_test WITH TEMPLATE shoe_store;_

## Known Bugs
_N/A_

## Technologies Used
* Ruby
* Sinatra
* SQL
* Postgres
* HTML
* CSS
* Bootstrap
* ES6

### License
*This software is licensed under the MIT license*
Copyright © 2017 **Dominic Brown**
