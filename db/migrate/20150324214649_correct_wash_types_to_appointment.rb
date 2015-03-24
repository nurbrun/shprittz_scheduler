class CorrectWashTypesToAppointment < ActiveRecord::Migration
  def change
    self.up
      remove_column :appointments, :inside_only
      remove_column :appointments, :inside_and_outside
      remove_column :appointments, :outside_only


      add_column :appointments, :inside_only, :string
      add_column :appointments, :inside_and_outside, :string
      add_column :appointments, :outside_only, :string
  end
end
