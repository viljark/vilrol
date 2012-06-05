class HomeController < ApplicationController
  def index
    @offers = Offer.where("end_date >= ?", Date.today).order("end_date ASC").limit(12)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offers }
    end
  end

end
