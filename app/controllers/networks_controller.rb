class NetworksController < ApplicationController
    skip_before_action :verify_authenticity_token
  protect_from_forgery prepend: true, with: :exception
  before_action :authenticate_user!
  before_action :set_network, only: [:show, :edit, :update, :destroy]

  # GET /networks
  # GET /networks.json
  def index
    if params[:ntype] == "grower"
    @growers = Grower.where(:seller_id => Seller.where(:uid => current_user.id).first.id)
  elsif params[:ntype] == "seller"
   @sellers = Seller.where(:in_network_of => Seller.where(:uid => current_user.id).first.id)
  else
       @customers = Customer.where(:in_chep_network_of => Seller.where(:uid => current_user.id).first.id)
  end
  end

  # GET /networks/1
  # GET /networks/1.json
  def show
  end

  # GET /networks/new
  def new
    @network = Network.new
  end

  # GET /networks/1/edit
  def edit
  end

  # POST /networks
  # POST /networks.json
  def create
    @network = Network.new(network_params)

    respond_to do |format|
      if @network.save
        format.html { redirect_to @network, notice: 'Network was successfully created.' }
        format.json { render :show, status: :created, location: @network }
      else
        format.html { render :new }
        format.json { render json: @network.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /networks/1
  # PATCH/PUT /networks/1.json
  def update
    respond_to do |format|
      if @network.update(network_params)
        format.html { redirect_to @network, notice: 'Network was successfully updated.' }
        format.json { render :show, status: :ok, location: @network }
      else
        format.html { render :edit }
        format.json { render json: @network.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /networks/1
  # DELETE /networks/1.json
  def destroy
    @network.destroy
    respond_to do |format|
      format.html { redirect_to networks_url, notice: 'Network was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network
      @network = Network.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_params
      params.fetch(:network, {})
    end
end
