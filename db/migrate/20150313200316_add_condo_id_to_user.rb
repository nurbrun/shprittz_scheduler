class AddCondoIdToUser < ActiveRecord::Migration
  def change
    self.up
      add_column :users, :condo_id, :integer
  end
end
