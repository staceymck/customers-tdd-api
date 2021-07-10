require 'rails_helper'

RSpec.describe Order, type: :model do
  #Association
  it { should belong_to(:customer) }
  #Validations
  it { should validate_presence_of(:item_name) }
end
