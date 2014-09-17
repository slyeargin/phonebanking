class Campaign < ActiveRecord::Base
  validates_presence_of :name, :summary
  has_many :targets
end
