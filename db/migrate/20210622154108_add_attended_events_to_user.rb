class AddAttendedEventsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :attended_events, :integer
  end
end
