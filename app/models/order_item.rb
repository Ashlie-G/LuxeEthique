class OrderItem < ApplicationRecord
  belongs_to :product_listing
  belongs_to :order
  before_save :set_unit_price
  before_save :set_total
#returns record from session if not new or destoryed
  def unit_price
    if persisted?
      self[:unit_price]
    else
      product_listing.price
    end
  end

  def total
    return unit_price * quantity
  end

  private
  def set_unit_price
    self[:unit_price] = unit_price
  end
  def set_total
    self[:total] = total * quantity
  end
end
