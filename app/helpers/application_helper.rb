module ApplicationHelper
  def show_registration_button(event)
    return unless signed_in?

    if event.attendances.exists?(user_id: current_user.id)
      # rubocop:disable Metrics/LineLength
      (link_to 'Attending!', remove_attendances_path(id: event.id), class: 'btn-warning m-1 btn-padding text-decoration-none', method: :delete).to_s.html_safe
    else
      (link_to 'Attend!', join_attendances_path(id: event.id), class: 'btn-magenta m-1 btn-padding text-white text-decoration-none', method: :post).to_s.html_safe
      # rubocop:enable Metrics/LineLength
    end
  end

  def show_create_event_button
    return unless current_user

    (link_to 'Create new event', new_event_path, class: 'nav-link btn-warning').to_s.html_safe
  end

  def show_user_name(current_user)
    if signed_in?
      "<li class='nav-item'>
          <div class='nav-link'>
            Logged in as [ <strong class='username'>#{link_to current_user.username,
                                                              profile_path(current_user.id)} </strong>]
          </div>
        </li>
        <li class='nav-item'>
           #{link_to 'logout', destroy_user_session_path, class: 'nav-link', method: :delete}
        </li>".html_safe
    else
      "<li class='nav-item'>
          #{link_to 'Log in', user_session_path, class: 'nav-link btn-magenta text-white'}
        </li>
        <li class='nav-item'>
          #{link_to 'Sign Up', new_user_registration_path, class: 'nav-link btn-warning btn-padding'}
        </li>".html_safe
    end
  end

  def show_events_attended_button
    return unless current_user

    (link_to 'Events attended', attended_events_path, method: :post, action: :attended,
                                                      class: 'nav-link').to_s.html_safe
  end

  def show_events_created_button
    return unless current_user

    (link_to 'Events created', created_events_path, method: :post, action: :created, class: 'nav-link').to_s.html_safe
  end
end
