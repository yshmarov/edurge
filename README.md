
rails g scaffold category name description:text
rails g scaffold course name description:text user:references category:references 
rails g scaffold chapter name number:integer course:references
rails g scaffold task name description:text video_url:text chapter:references

rails g scaffold marathon course:references start:datetime end:datetime price:integer
rails g scaffold marathon_users marathon:references user:references
rails g scaffold feedback*

rails g migration add_rating_to_course ratings_count:integer ratings_sum:integer rating:decimal

only users that are marathon_users of this course can leave 1 review per course
rails g scaffold review rating:integer comment:text user:references
add TAGS to courses

paginate tasks inside courses, mark tasks complete
add_order_to_tasks (order inside chapter)

add_booleans_to_courses published:boolean approved:boolean

pundit & rolify



add language to course
add duration to course
add price to course


slug & friendly_id

ransack?


OTHER COURSE FIELDS
increments id
string title
text short_description
text description
text outcomes
text section
text requirements
string language
double price
string level 50);
string thumbnailnullable();
string video_urlnullable();
boolean visibility

OTHER LESSON FIELDS
            $table->increments('id');
            $table->unsignedInteger('course_id');
            $table->string('title');
            $table->string('duration');
            $table->string('video');
            $table->timestamps();
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
