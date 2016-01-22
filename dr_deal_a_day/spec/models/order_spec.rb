require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "self.total" do
    it "totals no orders" do
      expect( Order.total ).to eq 0
    end

    it "totals some orders" do
      i = Item.create name: "Wheel", price: 6.00
      Order.create quantity: 1, item_id: i.id

      i = Item.create name: "Tire", price: 3.00
      Order.create quantity: 2, item_id: i.id

      expect( Order.total ).to eq 12.00
    end
  end
end
