class PurchasesController < ApplicationController
  before_filter do
    authenticate_user! rescue redirect_to auth_url
  end
  
  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.find_all_by_user_id(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @purchases }
    end
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
    @purchase = Purchase.find(params[:id])
    @offer = Offer.find(@purchase.offer_id)
    respond_to do |format|
    if current_user.id == @purchase.user_id 
        format.html # show.html.erb
        format.json { render json: @purchase }
    else
       format.html { redirect_to purchases_url, alert: 'You only can view your purchases!' }    
    end
      end
  end


  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to purchases_url }
      format.json { head :no_content }
    end
  end
end
