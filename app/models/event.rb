class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
    has_many :attendances, dependent: :destroy
    has_many :attendees, through: :attendances, source: :user
end
