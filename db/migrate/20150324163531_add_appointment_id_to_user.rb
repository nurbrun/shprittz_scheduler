class AddAppointmentIdToUser < ActiveRecord::Migration
  def change
    self.up
      add_column :users, :appointment_id, :integer
  end
end
