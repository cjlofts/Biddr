require 'rails_helper'

RSpec.describe Auction, type: :model do
  def valid_attributes(new_attributes)
    attributes = {title: "Mountain Bike",
                  details: "Good as new, only one owner",
                  ends_on: (Time.now + 30.days),
                  reserve_price: 500}
    attributes.merge(new_attributes)
  end

  describe "validations" do
    it "requires a title" do
      a = Auction.new(valid_attributes(title: nil))
      expect(a).to be_invalid
    end

    it "requires details" do
      a = Auction.new(valid_attributes(details: nil))
      expect(a).to be_invalid
    end

    it "requires a numerical reserve" do
      a = Auction.new(valid_attributes(reserve_price: "asdf"))
      expect(a).to be_invalid
    end

    it "requires the reserve to be greater than 1" do
      a = Auction.new(valid_attributes(reserve_price: 0))
      a.save
      expect(a.errors.messages).to have_key(:reserve_price)
    end

    it "requires a reserve price" do
      a = Auction.new(valid_attributes(reserve_price: nil))
      expect(a).to be_invalid
    end

    it "requires a finish date" do
      a = Auction.new(valid_attributes(ends_on: nil))
      expect(a).to be_invalid
    end

  end
end
