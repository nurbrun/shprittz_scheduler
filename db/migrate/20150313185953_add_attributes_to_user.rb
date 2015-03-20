class AddAttributesToUser < ActiveRecord::Migration
  def change
    self.up
      add_column :users, :name, :string
      add_column :users, :phone, :string
  end
end