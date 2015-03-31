class AddAppointmentIdToUserAgain < ActiveRecord::Migration
  def change
    self.up
      remove_column :users, :appointment_id
      add_column :users, :appointment_id, :integer
  end
end
