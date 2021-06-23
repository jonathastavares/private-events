module ApplicationHelper
    def show_registration_button(event)
        if event.attendances.exists?(user_id: current_user.id)
          '<p>You are attending to this event!</p>'.html_safe
          # rubocop:disable Metrics/LineLength
          (link_to 'I will not attend this event', join_attendances_path(id: @event.id), class: 'btn btn-primary mb-4', method: :delete).to_s.html_safe
        else
          (link_to 'Attend this event', join_attendances_path(id: @event.id), class: 'btn btn-primary mb-4', method: :post).to_s.html_safe
          # rubocop:enable Metrics/LineLength
        end
    end

    def show_create_event_button
      return unless current_user
      (link_to 'Create new event', new_event_path, class: 'nav-link text-info').to_s.html_safe
    end

    def show_user_name(current_user)
      if signed_in?
        "<li class='nav-item'>
          <div class='nav-link text-white'>
            Logged in as [ <strong  >#{link_to current_user.username, profile_path(current_user.id)} </strong>]
          </div>
        </li>
        <li class='nav-item'>
           #{link_to 'logout', destroy_user_session_path, class: 'nav-link text-white', method: :delete}
        </li>".html_safe
      else
        "<li class='nav-item'>
          #{link_to 'Log in / Sign up', new_user_registration_path, class: 'nav-link text-white'}
        </li>".html_safe
      end
    end
end
