class DataFile < ActiveRecord::Base
  has_many :orders
  validates :file_name, :file_contents, presence: true

  def self.import file
    data_file = create! file_name: file.original_filename, 
      file_contents: file.to_json

    total = 0 

    CSV.foreach file.path, headers: true do |row|
      p = Purchaser.new name: row[ 0 ]
      i = Item.new name: row[ 1 ], price: row[ 2 ]
      m = Merchant.new address: row[ 4 ], name: row[ 5 ]

      o = Order.new quantity: row[ 3 ], data_file: data_file, 
        merchant: m, item: i, purchaser: p

      next unless p.valid? && i.valid? && m.valid? && o.valid?
      total += o.quantity * i.price

      p.save!
      i.save!
      m.save!
      o.save!
    end

    return total
  end
end
