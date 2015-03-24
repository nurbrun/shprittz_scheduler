class AddAppointmentIdToCondo < ActiveRecord::Migration
  def change
    self.up
      add_column :condos, :appointment_id, :integer
  end
end
