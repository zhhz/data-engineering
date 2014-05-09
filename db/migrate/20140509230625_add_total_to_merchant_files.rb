class AddTotalToMerchantFiles < ActiveRecord::Migration
  def change
    add_column :merchant_files, :total, :decimal
  end
end
