class Merchant < ActiveRecord::Base
  validates_presence_of :name, :address

  has_many :items
end
