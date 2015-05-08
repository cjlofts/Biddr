class Auction < ActiveRecord::Base
  validates :title, presence: true
  validates :details, presence: true
  validates :reserve_price, numericality: {greater_than_or_equal_to: 1}
  validates :ends_on, presence: true

  has_many :bids
end
