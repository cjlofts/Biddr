class BidsController < ApplicationController

  def create
    @auction = Auction.find params[:auction_id]
    @bid = Bid.new(bid_params)
    @bid.auction = @auction
    if @auction.bids.count == 0 || (@bid.amount > @auction.bids.maximum(:amount))
      if @bid.save
        if @bid.amount >= @auction.reserve_price
          @auction.meet_reserve
          @auction.save
        end
        redirect_to @auction, notice: "Bid Created!"
      else
        flash[:alert] = "Bid Not Created"
        render "auctions/show"
      end
    else
      flash[:alert] = "Bid must be higher than $#{@auction.bids.maximum(:amount)}.00"
      redirect_to @auction
    end
  end

  def destroy
    @auction = Auction.find params[:auction_id]
    @bid = Bid.find params[:id]
    @bid.destroy
    redirect_to @auction, notice: "Bid Deleted!"
  end

  private

  def bid_params
    params.require(:bid).permit(:amount)
  end

end
