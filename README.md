README

# Best Udemy Clone on the market. Set up your online school in minutes!

Source: https://github.com/yshmarov/edurge

Demo: https://edurge.herokuapp.com/

---

Schema: 
![alt text](https://imgur.com/jnyWARu.png "Schema")

---

Homepage: 
![alt text](https://imgur.com/QJvjyJb.png "Homepage")

---

Create a course:
![alt text](https://imgur.com/e3AyIZO.png "Create a course")

---

View course:
![alt text](https://i.imgur.com/vCalc35.png "View course")

---

View lesson:
![alt text](https://i.imgur.com/07pcKLV.png "View lesson")

---

Leave a review to a course:
![alt text](https://i.imgur.com/rUMqBDO.png "Leave a review to a course")

---

Admin can view all subscriptions, teacher can view subscriptions to his courses:
![alt text](https://i.imgur.com/Hw87nOr.png "Admin can view all subscriptions, teacher can view subscriptions to his courses")

---

# Features

* Users can log in +

* Users can browse courses +
* Users can subscribe to free courses +
* Users can see the lesson content only of courses that they bought +
* Users can review and rate courses that they bought +
* Users can see their progress in a course +
* Users can pay for courses (no payment system connected yet) -

* Users-Teachers can create courses & lessons inside them +
* Users-Teachers can see users that subscribed to their courses +
* Users-Teachers can earn money on  their courses (no payment system connected yet) -

* Users-Admins can add categories +
* Users-Admins can approve/unapprove courses (make courses available/unavailable) +
* Users-Admins can view all subscriptions +
* Users-Admins can view all users +

Roles `[:admin, :teacher, :student]`

`        	    Create	        Show	    Edit	Destroy`

`User	        Owner	        All	        Owner	Admin, Owner`

`Category	    Admin	        All	        Admin	Admin`

`Course	      All	          All	        Owner	Admin, Owner`

`Lesson	      Course owner	Subscriber	Owner	Owner`

`Subscription	Owner	        Admin	      Owner	Admin, Owner`

---

# TO DO

*integrate a payments provider to actually pay for courses*

*lesson duration*
* use youtube api, or whatever the video provider is to fetch video duration

*make it a PWA (with rails 6)*

*rich text editing for course/description (with rails 6)*

*omniauth with google & facebook*

*add TAGS to courses*
* rails g migration tags name
* rails g migration course_tags course:references tag:references
* Tags can be like ruby_on_rails, javascript, accounting, CEO, SMM, whatever

*write tests! No tests have been written for the app*

*lesson options*
* acts_as_votable (like/dislike)
* quizzes

---

# INSTALLATION

### System dependencies

`ruby '2.6.5'`

`gem 'rails', '~> 5.2.3'`

`database: postgresql`

### Configuration

`git clone https://github.com/yshmarov/edurge`

`bundle install`

### Empty database

`rails db:drop db:create db:migrate`

###  database with sample data

`rails db:drop db:create db:migrate db:seed`

### Run the app

`rails s`

---

If you don't want any user to be able to create own courses, you should comment the field in `user.rb`:

  `self.add_role(:teacher)`

to be like this

  `#self.add_role(:teacher)`

---

Contact: yashm@outlook.com

