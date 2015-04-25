class AddCityToUser < ActiveRecord::Migration
  def change
    self.up
      add_column :users, :city, :string
  end
end
