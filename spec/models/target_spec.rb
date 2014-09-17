require 'rails_helper'

RSpec.describe Target, :type => :model do
  it { should validate_presence_of :campaign }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :phone_number }
  it { should validate_presence_of :zipcode }
end
