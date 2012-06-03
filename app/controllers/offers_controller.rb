class OffersController < ApplicationController
  
  before_filter do
    authenticate_user! rescue redirect_to auth_url
  end
  
  # GET /offers
  # GET /offers.json
  def index
    if params["filter"] && params["filter"] == "mine"
      @offers = Offer.find_all_by_provider_id(current_user.id)
    else
      @offers = Offer.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offers }
    end
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    @offer = Offer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @offer }
    end
  end

  # GET /offers/new
  # GET /offers/new.json
  def new
    if current_user.is_provider
      @offer = Offer.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @offer }
      end
    else
      redirect_to "/offers", :alert => "In order to create offers, you have to become provider."
    end
  end

  # GET /offers/1/edit
  def edit
    @offer = Offer.find(params[:id])
  end

  # POST /offers
  # POST /offers.json
  def create
    p = params[:offer]
    p["provider_id"] = current_user.id
    @offer = Offer.new(p)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
        format.json { render json: @offer, status: :created, location: @offer }
      else
        format.html { render action: "new" }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /offers/1
  # PUT /offers/1.json
  def update
    @offer = Offer.find(params[:id])

    respond_to do |format|
      if @offer.update_attributes(params[:offer])
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to offers_url }
      format.json { head :no_content }
    end
  end
  
  #popluar offers
  def popular
    @offers = Offer.all
    
    respond_to do |format|
      format.html
      format.json { head :no_content }
    end
  end
  
end
