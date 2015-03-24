class AddWashTypesToAppointment < ActiveRecord::Migration
  def change
    self.up
      add_column :appointments, :inside_only, :integer
      add_column :appointments, :inside_and_outside, :integer
      add_column :appointments, :outside_only, :integer
  end
end
