class MarketplacesController < ApplicationController
  before_action :set_marketplace, only: %i[ show edit update destroy ]

  # GET /marketplaces or /marketplaces.json
  def index
    @marketplaces = Marketplace.all
  end

  # GET /marketplaces/1 or /marketplaces/1.json
  def show
  end

  # GET /marketplaces/new
  def new
    @marketplace = Marketplace.new
  end

  # GET /marketplaces/1/edit
  def edit
  end

  # POST /marketplaces or /marketplaces.json
  def create
    @marketplace = Marketplace.new(marketplace_params)

    respond_to do |format|
      if @marketplace.save
        format.html { redirect_to marketplace_url(@marketplace), notice: "Marketplace was successfully created." }
        format.json { render :show, status: :created, location: @marketplace }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @marketplace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marketplaces/1 or /marketplaces/1.json
  def update
    respond_to do |format|
      if @marketplace.update(marketplace_params)
        format.html { redirect_to marketplace_url(@marketplace), notice: "Marketplace was successfully updated." }
        format.json { render :show, status: :ok, location: @marketplace }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @marketplace.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marketplaces/1 or /marketplaces/1.json
  def destroy
    @marketplace.destroy

    respond_to do |format|
      format.html { redirect_to marketplaces_url, notice: "Marketplace was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marketplace
      @marketplace = Marketplace.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def marketplace_params
      params.require(:marketplace).permit(:user_id, :item_id, :price, :stock, :lock_version)
    end
end
