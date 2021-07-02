class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, source: :user
  scope :upcoming_events, -> { where('event_date >= ?', Date.today) }
  scope :past_events, -> { where('event_date < ?', Date.today) }
end
