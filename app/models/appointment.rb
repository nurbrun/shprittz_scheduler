class Appointment < ActiveRecord::Base
  belongs_to :condo
  belongs_to :user
end
