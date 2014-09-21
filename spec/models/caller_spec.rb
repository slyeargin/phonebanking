require 'rails_helper'

RSpec.describe Caller, :type => :model do
  it { should validate_presence_of :campaign }
  it { should validate_presence_of :user }
  # it { should validate_presence_of :is_campaign_owner }  
end
