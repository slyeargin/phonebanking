class Caller < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign

  # validates_presence_of :campaign, :user, :is_campaign_owner
  validates_presence_of :campaign, :user
end
