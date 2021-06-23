module ApplicationHelper
    def show_registration_button(event)
        if event.attendances.exists?(user_id: current_user.id)
          # rubocop:disable Metrics/LineLength
          (link_to 'I will not attend this event', remove_attendances_path(id: @event.id), class: 'btn btn-warning', method: :delete).to_s.html_safe
        else
          (link_to 'Attend this event', join_attendances_path(id: @event.id), class: 'btn btn-warning', method: :post).to_s.html_safe
          # rubocop:enable Metrics/LineLength
        end
    end

    def show_attendance(event)
      if event.attendances.exists?(user_id: current_user.id)
        '<span class="btn-warning m-1 p-2">Attending!
        </span>'.html_safe
      else
        '<span class="btn-warning m-1 p-2">Attend!
        </span>'.html_safe
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
            Logged in as [ <strong class='username'>#{link_to current_user.username, profile_path(current_user.id)} </strong>]
          </div>
        </li>
        <li class='nav-item'>
           #{link_to 'logout', destroy_user_session_path, class: 'nav-link', method: :delete}
        </li>".html_safe
      else
        "<li class='nav-item'>
          #{link_to 'Log in', user_session_path, class: 'nav-link btn-secondary text-white'}
        </li>
        <li class='nav-item'>
          #{link_to 'Sign Up', new_user_registration_path, class: 'nav-link btn-warning'}
        </li>".html_safe
      end
    end

    def show_events_attended_button
      return unless current_user
      (link_to 'Events attended', profile_path(current_user), class: 'nav-link').to_s.html_safe
    end

    def show_events_created_button
      return unless current_user
      (link_to 'Events created', profile_path(current_user), class: 'nav-link').to_s.html_safe
    end
end
