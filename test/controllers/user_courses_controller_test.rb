require 'test_helper'

class UserCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_course = user_courses(:one)
  end

  test "should get index" do
    get user_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_user_course_url
    assert_response :success
  end

  test "should create user_course" do
    assert_difference('UserCourse.count') do
      post user_courses_url, params: { user_course: { comment: @user_course.comment, course_id: @user_course.course_id, rating: @user_course.rating, user_id: @user_course.user_id } }
    end

    assert_redirected_to user_course_url(UserCourse.last)
  end

  test "should show user_course" do
    get user_course_url(@user_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_course_url(@user_course)
    assert_response :success
  end

  test "should update user_course" do
    patch user_course_url(@user_course), params: { user_course: { comment: @user_course.comment, course_id: @user_course.course_id, rating: @user_course.rating, user_id: @user_course.user_id } }
    assert_redirected_to user_course_url(@user_course)
  end

  test "should destroy user_course" do
    assert_difference('UserCourse.count', -1) do
      delete user_course_url(@user_course)
    end

    assert_redirected_to user_courses_url
  end
end
