class CreateMerchantFiles < ActiveRecord::Migration
  def change
    create_table :merchant_files do |t|
      t.string :name

      t.timestamps
    end
  end
end
