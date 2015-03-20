class CorrectionToCondoAttribute < ActiveRecord::Migration
  def change
    self.up
    remove_column :condos, :park_spot   
    add_column :condos, :parking_spot, :string
  end
end
