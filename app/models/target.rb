class Target < ActiveRecord::Base
  belongs_to :campaign
  has_many :responses

  validates_presence_of :campaign, :first_name, :last_name, :phone_number, :zipcode

  accepts_nested_attributes_for :responses,
    reject_if: proc { |attributes| attributes['answer'].blank? } 
end
