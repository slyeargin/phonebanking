class Target < ActiveRecord::Base
  belongs_to :campaign
  validates_presence_of :campaign, :first_name, :last_name, :phone_number, :zipcode
end
