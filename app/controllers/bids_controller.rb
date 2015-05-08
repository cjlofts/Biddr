class BidsController < ApplicationController

  def create
    @auction = Auction.find params[:auction_id]
    @bid = Bid.new(bid_params)
    @bid.auction = @auction
    if @bid.save
      redirect_to @auction, notice: "Bid Created!"
    else
      flash[:alert] = "Bid Not Created"
      render "auctions/show"
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

# def create
#     @campaign        = Campaign.find params[:campaign_id]
#     @pledge          = Pledge.new pledge_params
#     @pledge.user     = current_user
#     @pledge.campaign = @campaign
#     if @pledge.save
#       redirect_to new_pledge_payment_path(@pledge), notice: "Pledge created"
#     else
#       flash[:alert] = "Pledge not created"
#       render "campaigns/show"
#     end
#   end
