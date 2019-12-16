module CoursesHelper
  def subscription_buttons(course)
    if current_user
      if course.user == current_user
        link_to "You created this course. View analytics", course_path(course)
      elsif course.subscriptions.where(user: current_user).any?
        link_to course_path(course) do
          "<i class='fa fa-spinner'></i>".html_safe + " " +
          number_to_percentage(course.progress(current_user), precision: 0)
        end
      elsif course.price > 0
        link_to number_to_currency(course.price), new_course_subscription_path(course), class: "btn btn-success"
      else
        link_to new_course_subscription_path(course), class: 'btn btn-md btn-success' do
          number_to_currency(course.price) + " " +
          "Free"
        end
      end
    else
      link_to "Check price", new_course_subscription_path(course), class: 'btn btn-md btn-success'
    end
  end

  def review_buttons(course)
    if current_user
      if course.subscriptions.where(user: current_user).any?
        if course.subscriptions.pending_review.where(user: current_user).any?
          link_to edit_subscription_path(course.subscriptions.pending_review.where(user: current_user).first) do
            "<i class='text-warning fa fa-star'></i>".html_safe + " " +
            "<i class='text-dark fa fa-question'></i>".html_safe + " " +
            "Review"
          end
        else
          "<i class='text-warning fa fa-star'></i>".html_safe + " " +
          "<i class='fa fa-check'></i>".html_safe + " " +
          "You have reviewed"
        end
      end
    end
  end

  #def action_buttons(course)
  #  if current_user
  #    if course.bought(current_user) && current_user.admin == false
  #      if course.price > 0
  #        link_to "Buy for &euro; ".html_safe+course.price.to_s, new_course_trade_path(course), class: "btn btn-danger"
  #      else
  #        link_to "FREE",course_trades_path(course), method: :post, class: "btn btn-success"
  #      end
  #    else
  #      link_to "Bought", course_path(course), class: "btn btn-success btn"
  #    end
  #  else
  #    if course.price > 0
  #      link_to "Buy for &euro; ".html_safe+course.price.to_s, new_course_trade_path(course), class: "btn btn-danger"
  #    else
  #      link_to "FREE",course_trades_path(course), method: :post, class: "btn btn-success"
  #    end
  #  end
  #end

end
