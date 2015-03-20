class AddUserIdToCondo < ActiveRecord::Migration
  def change
    self.up
      add_column :condos, :user_id, :integer
  end
end
