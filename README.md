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

*home/index - do not show current_user courses that he has already subscribed to*

*track completion of lesson by user (user_lesson=completion) user_id lesson_id seen:boolean unique lesson-user pair*

*add_fields_to_lessons duration:integer*

*devise mailer*
* confirmable
* sendgrid

*gem pagy*
* paginate lessons inside courses, mark lessons complete
* paginate Course.all in CoursesController

*HELP NEEDED*

*update to rails 6*

*make it a PWA*

*rich text editing for course/description*

*omniauth with google & facebook*

*recatcha for creating a user (if not oAuth)*

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
* Users-Students can subscribe to free courses. +
* Users-Students can buy courses. -
* Users-Students can review and rate courses that they bought. +
* Users-Students can see the lesson content only of courses that they bought. -

* Users-Teachers can create and manage their courses. +
* Users-Teachers can earn money on  their courses. -

* Users-Admins can approve/unapprove courses (make courses available/unavailable) +
* Users-Admins can add categories +
* Users-Admins can view all subscriptions +
* Users-Admins can view all users -

---

* Ruby version

6+

* System dependencies

database: postgresql

* Configuration

git clone https://github.com/yshmarov/edurge
bundle install
rails db:drop db:create db:migrate db:seed
rails db:drop db:create db:migrate
rails s

If you don't want any user to be able to create own courses, you should comment the field in `user.rb`:
  `self.add_role(:teacher)`
to be like this
  `#self.add_role(:teacher)`

* Database creation

* Database initialization

* How to run the test suite

No tests yet. Help needed

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* roles [:admin, :teacher, :student]

        	    Create	        Show	    Edit	Destroy
User	        Owner	        All	        Owner	Admin, Owner
Category	    Admin	        All	        Admin	Admin
Course	        All	            All	        Owner	Admin, Owner
Lesson	        Course owner	Subscriber	Owner	Owner
Subscription	Owner	        Admin	    Owner	Admin, Owner

