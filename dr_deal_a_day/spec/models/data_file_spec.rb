require 'rails_helper'

RSpec.describe DataFile, type: :model do
  describe "#import" do
    it "imports a data file" do
      path = "#{::Rails.root}/../example_files/example_data.csv" 

      file = OpenStruct.new(
        original_filename: "example_data.csv", 
        path: path, 
        contents: "data"  )

      DataFile.import file

      expect( Order.count ).to eq 4
      expect( Purchaser.count ).to eq 4
      expect( Item.count ).to eq 4
      expect( Merchant.count ).to eq 4
      expect( DataFile.count ).to eq 1
    end
  end
end
