/.jumbotron
/courses that a user created
/  = current_user.courses.count
/courses that a user bought
/  = current_user.subscriptions.count
.jumbotron
  .display-4
    What do you want to learn?
  %p.py-4
  .form-inline.my-2.my-lg-0
    = form_tag(courses_path, method: :get) do
      .input-group
        = text_field_tag :name, params[:name], autocomplete: 'off', placeholder: "Find a course", class: 'form-control-lg'
        %span.input-group-append
          %button.btn.btn-primary.btn-lg{:type => "submit"}
            %span.fa.fa-search{"aria-hidden" => "true"}

.card-group
  .card.card-body
    %h1
      .fa.fa-graduation-cap
    = Course.published.approved.count
    online courses
    .row
    Explore a variety of fresh topics
  .card.card-body
    %h1
      .fa.fa-chalkboard-teacher
      /.fa.fa-brain
    = Course.distinct.count(:user_id)
    expert instructors
    .row
    Find the right instructor for you
  .card.card-body
    %h1
      .fa.fa-user-graduate
    = User.count
    active learners
    .row
    Join the knowledge sharing community
  .card.card-body
    %h1
      .fa.fa-infinity
    Lifetime access
    .row
    Learn on your schedule

%br

- if current_user
  .text-white
    %h3
      .fa.fa-user-graduate
      Continue learning
  .card-columns
    - @purchased_courses.each do |course|
      = render 'courses/course', course: course
  .text-right
    = link_to purchased_courses_path do
      All my courses
  %hr.bg-light

.text-white
  %h3
    .fa.fa-chart-line
    Popular courses
.card-columns
  - @popular_courses.each do |course|
    = render 'courses/course', course: course
.text-right
  = link_to popular_courses_path do
    More popular courses

%hr.bg-light
.text-white
  %h3
    .fa.fa-star
    Top rated courses
.card-columns
  - @top_rated_courses.each do |course|
    = render 'courses/course', course: course
.text-right
  = link_to top_rated_courses_path do
    More top rated courses

%hr.bg-light
.text-white
  %h3
    .fa.fa-clock
    Latest courses
.card-columns
  - @latest_courses.each do |course|
    = render 'courses/course', course: course
.text-right
  = link_to latest_courses_path do
    More latest courses

%hr.bg-light
.text-white
  %h3
    .fa.fa-chart-line
    Popular categories
.card-columns
  - @popular_categories.each do |category|
    = render 'categories/category', category: category
.text-right
  = link_to categories_path do
    More popular categories

%hr.bg-light
.text-white
  %h3
    .fa.fa-comment
    What our students have to say
.card-columns
  - @latest_good_subscriptions.each do |subscription|
    = render 'subscriptions/subscription', subscription: subscription

