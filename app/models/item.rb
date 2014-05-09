class Item < ActiveRecord::Base
  validates_presence_of :description, :price

  belongs_to :merchant
  belongs_to :order
end
