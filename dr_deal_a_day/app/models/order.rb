class Order < ActiveRecord::Base
  belongs_to :data_file
  belongs_to :merchant
  belongs_to :item
  belongs_to :purchaser

  validates :quantity, presence: true

  def self.total
    total = 0

    all.each do |order|
      total += order.quantity * order.item.price
    end

    return total
  end
end
