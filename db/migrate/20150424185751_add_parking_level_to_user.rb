class AddParkingLevelToUser < ActiveRecord::Migration
  def change
    self.up
      rename_column :users, :parking_spot, :parking_number
      add_column :users, :parking_level, :string
  end
end
