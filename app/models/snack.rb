class Snack < ApplicationRecord
  validates_presence_of :name, :price
  belongs_to :machine

  def pricify(price)
    price.to_s.ljust(4, "0")
  end

  def self.average_price
    avg = average(:price).to_f
    avg.to_s.ljust(4, "0")
    #couldn't call pricify, why?
  end
end
