class Bid < ActiveRecord::Base
  belongs_to :auction
  belongs_to :user

  validates :amount, numericality: {greater_than_or_equal_to: 1}

  scope :highest_first, lambda {order("amount DESC") }

end
