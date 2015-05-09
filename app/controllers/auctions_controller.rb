class AuctionsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_auction, only: [:show, :edit, :update, :destroy]

  def index
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = current_user.auctions.new(auction_params)
    if @auction.save
      redirect_to @auction, notice: "Auction Created!"
    else
      render :new
      flash[:alert] = "Auction was not created"
    end
  end

  def show
    @bid = Bid.new
    @bids = @auction.bids
  end

  def edit
  end

  def update
    if @auction.update(auction_params)
      redirect_to @auction, notice: "Auction Updated!"
    else
      render :edit
      flash[:alert] = "Auction not updated"
    end
  end

  def destroy
    @auction.destroy
    redirect_to auctions_path, notice: "Auction Deleted!"
  end

  private

  def auction_params
    params.require(:auction).permit(:title, :details, :ends_on, :reserve_price)
  end

  def find_auction
    @auction = Auction.find params[:id]
  end

end
