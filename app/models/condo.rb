class Condo < ActiveRecord::Base
  has_many :users
  validates_presence_of :address
  
  def to_param
      address
  end

end
