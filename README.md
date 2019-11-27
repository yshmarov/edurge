
add_level_to_course level:string 
beginner
intermediate
advanced

course analytics::::
user_courses.count per time
user_courses.rating per time
earnings per time

rails g scaffold marathon course:references start:datetime end:datetime price:integer
rails g scaffold marathon_users marathon:references user:references

add TAGS to courses

paginate lessons inside courses, mark lessons complete
add_order_to_lessons (order inside chapter)

pundit & rolify
roles [:admin, :teacher, :student]

ransack?

OTHER LESSON FIELDS
            $table->increments('id');
            $table->unsignedInteger('course_id');
            $table->string('title');
            $table->string('duration');
            $table->string('video');

Devise mailer

---

README

Best Udemy Clone on the market. Set up your online school in minutes!

---

Schema: 
![alt text](https://imgur.com/PmwESin.png "Schema")

---

Homepage: 
![alt text](https://imgur.com/QJvjyJb.png "Homepage")

---

Create a course:
![alt text](https://imgur.com/e3AyIZO.png "Create a course")

---

Models:
User
Category
Course
Subscription (user_course + rating + review)
Lesson

Functions:
* Users can log in. +
* Users can browse courses. +
* Users can buy courses. -
* Users can review and rate courses that they bought. -
* Users can see the lesson content only of courses that they bought. -
* 
* Users-Teachers can create and manage their courses. +
* 
* Users-Admins can approved/unapprove courses (make courses available/unavailable)
* Users-Admins can add categories
* Users-Admins can view all subscriptions

* Ruby version

6+

* System dependencies

database: postgresql

* Configuration

git clone https://github.com/yshmarov/edurge
bundle install
rake db:drop db:create db:migrate db:seed
rails s

* Database creation

* Database initialization

* How to run the test suite

No tests yet. Help needed

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
