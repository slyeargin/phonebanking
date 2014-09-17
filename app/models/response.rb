class Response < ActiveRecord::Base
  belongs_to :target
  belongs_to :campaign

  validates_presence_of :campaign, :target, :question, :answer, :contacted_when
end
