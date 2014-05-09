class Purchaser < ActiveRecord::Base
  validates_presence_of :name

  has_many :orders
  has_many :items,  through: :orders
end
