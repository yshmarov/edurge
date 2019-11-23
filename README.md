
rails g scaffold category name descroption:text
rails g scaffold course name descroption:text user:references category:references 
rails g scaffold chapter name number:integer course:references
rails g scaffold task name descroption:text video_url:text chapter:references

rails g scaffold marathon course:references start:datetime end:datetime price:integer
rails g scaffold marathon_users marathon:references user:references
rails g scaffold feedback*

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
