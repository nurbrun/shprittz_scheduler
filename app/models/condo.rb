class Condo < ActiveRecord::Base
  has_many :users
  has_many :appointments
  
  validates_presence_of :address

  def to_param
      address
  end

end
