class Order < ApplicationRecord
  belongs_to :customer
  validates :item_name, presence: true
end
