class Script < ActiveRecord::Base
  belongs_to :campaign
  validates_presence_of :campaign_id, :copy
  
end
