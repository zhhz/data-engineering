require 'csv'

class MerchantFile < ActiveRecord::Base
  validates_presence_of :name

  # TODO transaction?
  def MerchantFile.process_file(uploaded_file)
    total = 0
    data = CSV.new(uploaded_file, headers: true, col_sep: "\t")

    data.each do |row|
      merchant        = Merchant.where(name:    row['merchant name'],
                                       address: row['merchant address']).first_or_create
      order           = Order.new
      order.purchaser = Purchaser.where(name: row['purchaser name']).first_or_create
      order.item_id   = Item.where(merchant_id: merchant.id,
                                   description: row['item description'],
                                   price:       row['item price']).first_or_create.id
      order.quantity  = row['purchase count']
      sub_total       = row['item price'].to_i * row['purchase count'].to_i
      order.save

      total += sub_total
    end
    total
  end
end
