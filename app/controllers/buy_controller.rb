class BuyController < ApplicationController
  # GET /offers
  def index
    @offer_id = params[:offer_id]
    @offer = Offer.find(params[:offer_id])
    logger.info("in index")    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def confirm
    @id = params[:id]
    @offer = Offer.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def create
    @offer_id = params[:id]
    @offer = Offer.find(params[:id])
    quantity = params[:buy_quantity].to_i
    respond_to do |format|
      if @offer.count >= quantity && quantity > 0
        @result = Offer.update(@offer_id, :count => (@offer.count - quantity))
        if @result && @result.valid?
          
          @purchase = Purchase.create!(:user_id => current_user.id, :offer_id => @offer_id, :quantity => quantity)
          logger.info(@result.errors.inspect)
          format.html { redirect_to @offer, notice: "Purchase was successful!" }
        else
          format.html { redirect_to @offer, alert: 'Purchase failed, the item is no longer available.' }
        end
      else
        format.html { redirect_to @offer, alert: 'Purchase failed, we\'re out of offers.' }
      end
    end
  end
end
