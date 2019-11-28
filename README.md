README

Best Udemy Clone on the market. Set up your online school in minutes!

Source: https://github.com/yshmarov/edurge
Demo: https://edurge.herokuapp.com/

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

*TODO*

*update to rails 6*

*make it a PWA*

*home/index - "continue learning"*

*home/index - "featured courses"*

*rich text editing for course/description*

*recatcha for creating a user*

*gem pagy*
* paginate lessons inside courses, mark lessons complete
* paginate Course.all in CoursesController

*pundit & rolify*
* roles [:admin, :teacher, :student]

*devise mailer*
* confirmable
* sendgrid

*omniauth with google & facebook*

*add_fields_to_lessons order:string duration:integer*

*teacher course analytics*
* chartkick & groupdate
* course.subscriptions.count per time
* course.subscriptions.rating per time
* course.subscriptions.price.sum per time

*admin analytics*
* chartkick & groupdate
* subscriptions.count per time
* subscriptions.rating per time
* users.created.count per time
* subscriptions.price.sum per time

*add TAGS to courses*
* rails g migration tags name
* rails g migration course_tags course:references tag:references
* Tags can be like ruby_on_rails, javascript, accounting, CEO, SMM, whatever

---

*Features:*
* Users-Students can log in. +
* Users-Students can browse courses. +
* Users-Students can buy courses. -
* Users-Students can review and rate courses that they bought. -
* Users-Students can see the lesson content only of courses that they bought. -

* Users-Teachers can create and manage their courses. +

* Users-Admins can approved/unapprove courses (make courses available/unavailable)
* Users-Admins can add categories
* Users-Admins can view all subscriptions

---

* Ruby version

6+

* System dependencies

database: postgresql

* Configuration

git clone https://github.com/yshmarov/edurge
bundle install
rails db:drop db:create db:migrate db:seed
rails s

* Database creation

* Database initialization

* How to run the test suite

No tests yet. Help needed

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
