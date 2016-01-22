class Merchant < ActiveRecord::Base
  has_many :orders
  validates :address, :name, presence: true
end
