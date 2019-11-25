rake db:drop db:create db:migrate db:seed
TODO

rails g scaffold marathon course:references start:datetime end:datetime price:integer
rails g scaffold marathon_users marathon:references user:references

only users that are marathon_users of this course can leave 1 review per course
add TAGS to courses

paginate lessons inside courses, mark lessons complete
add_order_to_lessons (order inside chapter)
pundit & rolify
ransack?

OTHER LESSON FIELDS
            $table->increments('id');
            $table->unsignedInteger('course_id');
            $table->string('title');
            $table->string('duration');
            $table->string('video');
OTHER RATING FIELDS
            $table->unsignedInteger('user_id');
            $table->unsignedInteger('course_id');
            $table->integer('rating');
            $table->text('review');

README

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
