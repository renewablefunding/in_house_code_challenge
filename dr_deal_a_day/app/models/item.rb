class Item < ActiveRecord::Base
  has_many :orders
  validates :name, :price, presence: true
end
