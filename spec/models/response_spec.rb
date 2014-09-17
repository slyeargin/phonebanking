require 'rails_helper'

RSpec.describe Response, :type => :model do
  it { should validate_presence_of :campaign }
  it { should validate_presence_of :target }
  it { should validate_presence_of :question }
  it { should validate_presence_of :answer }
end
