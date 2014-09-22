class Campaign < ActiveRecord::Base
  validates_presence_of :name, :summary
  has_many :targets
  has_many :responses

  has_many :users, through: :callers
  has_many :callers

  has_many :scripts

  accepts_nested_attributes_for :scripts
end
