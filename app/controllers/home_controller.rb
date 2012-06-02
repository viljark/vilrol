class HomeController < ApplicationController
  def index
    @offers = Offer.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offers }
    end
  end

end
