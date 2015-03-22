class AddCandoParamsToUserModel < ActiveRecord::Migration
  def change
    self.up
      add_column :users, :suite, :string
      add_column :users, :parking_spot, :string
      add_column :users, :postal_code, :string
  end
end
