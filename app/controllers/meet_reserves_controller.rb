class MeetReservesController < ApplicationController

  def meet_reserve
    auction = Auction.find params[:id]
    auction.meet_reserve
    auction.save
  end

end
