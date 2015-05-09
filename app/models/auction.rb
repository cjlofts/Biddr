class Auction < ActiveRecord::Base
  include AASM

  validates :title, presence: true
  validates :details, presence: true
  validates :reserve_price, numericality: {greater_than_or_equal_to: 1}
  validates :ends_on, presence: true

  has_many :bids

  aasm whiny_transitions: false do
    state :published, initial: true
    state :reserve_met
    state :won
    state :cancelled
    state :reserve_not_met

    event :meet_reserve do
      transitions from: :published, to: :reserve_met
    end
  end

end
