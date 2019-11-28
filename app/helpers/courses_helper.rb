module CoursesHelper
  def action_buttons(course)
    if current_user
      if course.user == current_user
        link_to "You have created this course. View analytics", course_path(course)
      elsif course.subscriptions.where(user: current_user).any?
        link_to "You have bought this course. Now, learn", course_path(course)
        link_to "Review", edit_subscription_path(course.subscriptions.pending_review.where(user: current_user).first)
        if course.subscriptions.pending_review.where(user: current_user).any?
          course.subscriptions.pending_review.where(user: current_user).each do |subscription|
            link_to "Review", edit_subscription_path(subscription)
          end
        else
          "You have reviewed"
        end
      else
        link_to number_to_currency(course.price), course_path(course), class: 'btn btn-md btn-success'
      end
    else
      link_to "Check price", course_path(course), class: 'btn btn-md btn-success'
    end

    #if current_user
    #  if course.bought(current_user) && current_user.admin == false
    #    if course.price > 0
    #      link_to "Buy for &euro; ".html_safe+course.price.to_s, new_course_trade_path(course), class: "btn btn-danger"
    #    else
    #      link_to "FREE",course_trades_path(course), method: :post, class: "btn btn-success"
    #    end
    #  else
    #    link_to "Bought", course_path(course), class: "btn btn-success btn"
    #  end
    #else
    #  if course.price > 0
    #    link_to "Buy for &euro; ".html_safe+course.price.to_s, new_course_trade_path(course), class: "btn btn-danger"
    #  else
    #    link_to "FREE",course_trades_path(course), method: :post, class: "btn btn-success"
    #  end
    #end
  end
end
