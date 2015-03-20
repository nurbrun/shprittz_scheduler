class AddAttributesToCondo < ActiveRecord::Migration
  def change
    self.up
      add_column :condos, :address, :string
      add_column :condos, :postal_code, :string
      add_column :condos, :suite, :string
      add_column :condos, :park_spot, :string
  end

end
