class AddAttendeesToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :attendees, :integer
  end
end
