class Order < ActiveRecord::Base
  validates_presence_of :purchaser_id, :item_id, :quantity

  belongs_to :purchaser
  belongs_to :items
end
