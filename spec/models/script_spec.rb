require 'rails_helper'

RSpec.describe Script, :type => :model do
  it { should validate_presence_of :campaign_id }
  it { should validate_presence_of :copy }
end
