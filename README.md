DONE
rails g scaffold category name description:text
rails g scaffold course name description:text user:references category:references 
rails g scaffold lesson name description:text video_url:text chapter:references
TODO

rails g scaffold marathon course:references start:datetime end:datetime price:integer
rails g scaffold marathon_users marathon:references user:references
rails g scaffold feedback*

rails g migration add_rating_to_course ratings_count:integer ratings_sum:integer rating:decimal

only users that are marathon_users of this course can leave 1 review per course
rails g scaffold review rating:integer comment:text user:references
add TAGS to courses

paginate lessons inside courses, mark lessons complete
add_order_to_lessons (order inside chapter)
pundit & rolify
slug & friendly_id
ransack?


add_fields_to_courses 
published:boolean approved:boolean language:string duration:integer price:integer short_description:text

:published, :approved, :language, :duration, :price, :short_description, 



OTHER COURSE FIELDS
text outcomes (what you will learn)
text requirements (what you need to know before, barriers to entry)
string thumbnailnullable();
string video_urlnullable();

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
