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
end
