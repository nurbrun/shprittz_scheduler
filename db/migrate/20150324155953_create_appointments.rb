class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :date
      t.string :wash_type
      t.integer :user_id
      t.integer :condo_id
      t.timestamps null: false
    end
  end
end
