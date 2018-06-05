class StocksController < ApplicationController
    skip_before_action :verify_authenticity_token
  protect_from_forgery prepend: true, with: :exception
  before_action :authenticate_user!
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  # GET /stocks.json
  def index
    @seller = Seller.where(:uid => current_user.id).first

    
    @stocks = Stock.where(:seller_id => @seller.id)

      
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @product = Product.find(stock_params[:product_id])
    stock_params[:buying_price] =  stock_params[:buying_price].scan(/\d/).join('').to_i

    if stock_params[:in_stock_quantity].present?
    stock_params[:in_stock_quantity] =  stock_params[:in_stock_quantity].scan(/\d/).join('').to_i
  end
    if stock_params[:physical_stock_quantity].present?
    stock_params[:physical_stock_quantity] =  stock_params[:physical_stock_quantity].scan(/\d/).join('').to_i
  end
     if stock_params[:variations].present?
    stock_params[:variations] =  stock_params[:variations].scan(/\d/).join('').to_i
  end
    if stock_params[:wasted_stock_quantity].present?
    stock_params[:wasted_stock_quantity] =  stock_params[:wasted_stock_quantity].scan(/\d/).join('').to_i
  end
 
    @stock = Stock.new(stock_params.merge(:product_name => @product.name,:in_stock_quantity => stock_params[:purchased_stock_quantity],:not_approved => stock_params[:purchased_stock_quantity],:desc => @product.name + '| ' + @product.category + '| ' + @product.quality + '| ' + @product.size.to_s + '| ' ))
    @product.update_attributes(:order_quantity_unit => stock_params[:order_quantity_unit])
    respond_to do |format|
      if @stock.save
        @notification = Notification.create(seller_id: @stock.seller_id, stock_id: @stock.id, content: "Approve stock added by Sales Team " + @stock.desc, ntype: "Approval" )
        format.html { redirect_to stocks_url, notice: 'Stock was successfully created.' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
if  stock_params[:approve_on_hold_stocks] == ""
    if stock_params[:total_approved_stocks] == ""
     respond_to do |format|
          if @stock.update(stock_params)

            format.html { redirect_to approval_index_path, notice: 'Stock was successfully updated.' }
            format.json { render :show, status: :ok, location: @stock }
          else
            format.html { render :edit }
            format.json { render json: @stock.errors, status: :unprocessable_entity }
          end
        end

    else

        onhold = @stock.in_stock_quantity - stock_params[:total_approved_stocks].to_i
        stockvalue = onhold * @stock.buying_price

        if onhold == 0
          respond_to do |format|
          if @stock.update(stock_params.merge(:offered => stock_params[:total_approved_stocks]))

            format.html { redirect_to approval_index_path, notice: 'Stock was successfully updated.' }
            format.json { render :show, status: :ok, location: @stock }
          else
            format.html { render :edit }
            format.json { render json: @stock.errors, status: :unprocessable_entity }
          end
        end
        else

            @stock.update_column(:in_stock_quantity,stock_params[:total_approved_stocks])
            @stock.update_column(:total_approved_stocks,stock_params[:total_approved_stocks])
            
            @stock.update_column(:offered,stock_params[:total_approved_stocks])
            @stock.update_column(:onhold,onhold)
            @stock.update_column(:not_approved,0)
            @stock.update_column(:status,'Approved')

              
              redirect_to approval_index_path

        end

      end

    else 

      new_approved = @stock.total_approved_stocks.to_i + stock_params[:approve_on_hold_stocks].to_i
      new_onhold = @stock.onhold.to_i - stock_params[:approve_on_hold_stocks].to_i
      new_offered = @stock.offered.to_i + stock_params[:approve_on_hold_stocks].to_i

 @stock.update_column(:offered,new_offered)
        @stock.update_column(:onhold,new_onhold)
        @stock.update_column(:total_approved_stocks,new_approved)
          redirect_to approval_index_path
    end
  




  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: 'Stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
       if current_user.utype == "Employee" 
        @employee = Employee.where(:email => current_user.email).first
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params
      params.require(:stock).permit(:product_id, :grower_id, :status, :buying_price, :buying_price_type, :in_stock_quantity, :physical_stock_quantity, :variations, :wasted_stock_quantity, :stock_updated_by, :stock_updated_time, :stock_approved_by, :stock_approved_time, :physical_stock_taken_by, :pstb_time, :stock_wasted_by, :stock_wasted_time,:seller_id,:product_name,:desc,:order_by, :order_quantity_unit, :net_weight, :packs_per_pellets,:stockvalue,:consignment_number,:consignment_image,:ref_no,:date_received,:grower_payment_status,:paid_value,:total_approved_stocks,:purchased_stock_quantity,:onhold,:sold,:offered,:supply_id,:osqval,:soldval,:isqval,:sku,:not_approved,:approve_on_hold_stocks,:note)
    end
end
