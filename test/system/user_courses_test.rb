require "application_system_test_case"

class UserCoursesTest < ApplicationSystemTestCase
  setup do
    @user_course = user_courses(:one)
  end

  test "visiting the index" do
    visit user_courses_url
    assert_selector "h1", text: "User Courses"
  end

  test "creating a User course" do
    visit user_courses_url
    click_on "New User Course"

    fill_in "Comment", with: @user_course.comment
    fill_in "Course", with: @user_course.course_id
    fill_in "Rating", with: @user_course.rating
    fill_in "User", with: @user_course.user_id
    click_on "Create User course"

    assert_text "User course was successfully created"
    click_on "Back"
  end

  test "updating a User course" do
    visit user_courses_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @user_course.comment
    fill_in "Course", with: @user_course.course_id
    fill_in "Rating", with: @user_course.rating
    fill_in "User", with: @user_course.user_id
    click_on "Update User course"

    assert_text "User course was successfully updated"
    click_on "Back"
  end

  test "destroying a User course" do
    visit user_courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User course was successfully destroyed"
  end
end
