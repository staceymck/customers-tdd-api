require 'rails_helper'

#Concise format possible because of ShouldaMatcher gem

RSpec.describe Customer, type: :model do
  #Associations
  it { should have_many(:orders) }
  #Validations
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:age) }
  it { should validate_presence_of(:phone_number) }
end
