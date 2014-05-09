class Purchaser < ActiveRecord::Base
  validates_presentce_of :name

  has_many :orders
  has_many :items,  through: :orders
end
