require 'rails_helper'

RSpec.describe Campaign, :type => :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :summary }
end
