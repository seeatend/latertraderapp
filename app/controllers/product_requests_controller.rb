class ProductRequestsController < ApplicationController
  before_action :set_product_request, only: [:show, :edit, :update, :destroy]

  # GET /product_requests
  # GET /product_requests.json
  def index
   if params[:ntype] == "received"
      @product_requests = ProductRequest.where(:poi_id => Seller.where(:seller_email => current_user.email).first.id)
   else
    @product_requests = ProductRequest.where(:seller_id => Seller.where(:seller_email => current_user.email).first.id)
  end
  end

  # GET /product_requests/1
  # GET /product_requests/1.json
  def show
  end

  # GET /product_requests/new
  def new
    @product_request = ProductRequest.new
  end

  # GET /product_requests/1/edit
  def edit
  end

  # POST /product_requests
  # POST /product_requests.json
  def create
    @product_request = ProductRequest.new(product_request_params)

    respond_to do |format|
      if @product_request.save
        format.html { redirect_to  b2b_index_path, notice: 'Product request was successfully created.' }
        format.json { render :show, status: :created, location: @product_request }
      else
        format.html { render :new }
        format.json { render json: @product_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_requests/1
  # PATCH/PUT /product_requests/1.json
  def update
    respond_to do |format|
      if @product_request.update(product_request_params)
        format.html { redirect_to  b2b_index_path, notice: 'Product request was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_request }
      else
        format.html { render :edit }
        format.json { render json: @product_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_requests/1
  # DELETE /product_requests/1.json
  def destroy
    @product_request.destroy
    respond_to do |format|
      format.html { redirect_to product_requests_url, notice: 'Product request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_request
      @product_request = ProductRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_request_params
      params.require(:product_request).permit(:seller_id, :product_id, :required_quantity, :required_date, :note,:poi_id,:quantity_type,:status)
    end
end
