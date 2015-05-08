require 'rails_helper'

RSpec.describe Bid, type: :model do
  def valid_attributes(new_attributes)
    attributes = {auction_id: 2,
                  amount: 200}
    attributes.merge(new_attributes)
  end

  describe "validations" do
    it "requires an amount" do
      b = Bid.new(valid_attributes(amount: nil))
      expect(b).to be_invalid
    end

    it "requires a numerical amount" do
      b = Bid.new(valid_attributes(amount: "asdf"))
      expect(b).to be_invalid
    end
  end
end
