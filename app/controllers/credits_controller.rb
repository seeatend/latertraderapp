class CreditsController < ApplicationController
  before_action :set_credit, only: [:show, :edit, :update, :destroy]

  # GET /credits
  # GET /credits.json
  def index
       @customer = Customer.new
    if params[:ntype] == "approval"
    @credits = Credit.all

  elsif params[:ntype] == "set"
    @customers = Customer.where(:in_network_of => Seller.where(:uid => current_user.id).first.id).where(:credit_type => "Seller Credit")
  else
 @customers = Customer.where(:in_network_of => Seller.where(:uid => current_user.id).first.id).where(:credit_type => "Credit Co-Op Credit")
  end
  end

  # GET /credits/1
  # GET /credits/1.json
  def show
  end

  # GET /credits/new
  def new
    @credit = Credit.new
  end

  # GET /credits/1/edit
  def edit
  end

  # POST /credits
  # POST /credits.json
  def create
    @credit = Credit.new(credit_params)

    respond_to do |format|
      if @credit.save
        format.html { redirect_to @credit, notice: 'Credit was successfully created.' }
        format.json { render :show, status: :created, location: @credit }
      else
        format.html { render :new }
        format.json { render json: @credit.errors, status: :unprocessable_entity }
      end
    end
  end


  def credit_update
    @customer = Customer.find(params[:customer][:id])
    if params[:customer][:credit_limit].present?
     @customer.update_column(:credit_limit,params[:customer][:credit_limit])
     @customer.update_column(:credit_utilized,params[:customer][:credit_utilized])
     @customer.update_column(:credit_available,params[:customer][:credit_available])
     @customer.update_column(:credit_due,params[:customer][:credit_due])
   else
     @customer.update_column(:coop_credit_limit,params[:customer][:coop_credit_limit])
     @customer.update_column(:coop_credit_utilized,params[:customer][:coop_credit_utilized])
     @customer.update_column(:coop_credit_available,params[:customer][:coop_credit_available])
     @customer.update_column(:coop_credit_due,params[:customer][:coop_credit_due])
   end
    redirect_to credits_path
  end

  # PATCH/PUT /credits/1
  # PATCH/PUT /credits/1.json
  def update
    respond_to do |format|
      if @credit.update(credit_params)

      if credit_params[:ctype] == "Seller Credit"
      new_limit =  @credit.order.customer.credit_limit.to_i + credit_params[:extended].to_i
      new_utilized = @credit.order.customer.credit_utilized.to_i + credit_params[:extended].to_i
      new_due = @credit.order.customer.credit_due.to_i + credit_params[:extended].to_i

     @credit.order.customer.update_column(:credit_limit,new_limit) 
     @credit.order.customer.update_column(:credit_utilized,new_utilized) 
     @credit.order.customer.update_column(:credit_due,new_due) 

      @credit.order.update_column(:o_status,"Credit Approved")
         deduct_from_offer(@credit.order.id)
      @credit.order.update_column(:paid_amount, @credit.value)
      @credit.order.update_column(:payment_done_date ,@credit.created_at)
      @credit.order.update_column(:payment_confirmed_by ,@credit.approved_by)
      @credit.order.update_column(:note_to_buyer ,@credit.note_to_buyer)


      @employee = Employee.where(:position => 'Market Staff').where(:status => 'Free').first
        @packing = Packing.create(employee_id: @employee.id,order_id:  @credit.order.id,status: "Assigned")
        @credit.order.update_column(:o_status,"Packing Under Process")
        @employee.update_column(:status, "Assigned")

        

        format.html { redirect_to credits_path, notice: 'Credit was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit }

      else 
        new_limit =  @credit.order.customer.coop_credit_limit.to_i + credit_params[:extended].to_i
      new_utilized = @credit.order.customer.coop_credit_utilized.to_i + credit_params[:extended].to_i
      new_due = @credit.order.customer.coop_credit_due.to_i + credit_params[:extended].to_i

      puts new_limit
      puts new_utilized
      puts new_due

     @credit.order.customer.update_column(:coop_credit_limit,new_limit) 
     @credit.order.customer.update_column(:coop_credit_utilized,new_utilized) 
     @credit.order.customer.update_column(:coop_credit_due,new_due) 

      @credit.order.update_column(:o_status,"Credit Approved")
       deduct_from_offer(@credit.order.id)
      @credit.order.update_column(:paid_amount, @credit.value)
      @credit.order.update_column(:payment_done_date ,@credit.created_at)
      @credit.order.update_column(:payment_confirmed_by ,@credit.approved_by)
      @credit.order.update_column(:note_to_buyer ,@credit.note_to_buyer)


      @employee = Employee.where(:position => 'Market Staff').where(:status => 'Free').first
        @packing = Packing.create(employee_id: @employee.id,order_id:  @credit.order.id,status: "Assigned")
        @credit.order.update_column(:o_status,"Packing Under Process")
        @employee.update_column(:status, "Assigned")

          

        format.html { redirect_to credits_path, notice: 'Credit was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit }
      end
      else
        format.html { render :edit }
        format.json { render json: @credit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credits/1
  # DELETE /credits/1.json
  def destroy
    @credit.destroy
    respond_to do |format|
      format.html { redirect_to credits_url, notice: 'Credit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def deduct_from_offer(order_id)
  @deditems = OrderedItem.where(:order_id => order_id)
  @deditems.each do |oitem|
    offer = Offer.find(oitem.offer_id)
    new_offer_quantity  = offer.total_quantity_on_offer.to_i - oitem.quantity.to_i
    offer.update_column(:total_quantity_on_offer,new_offer_quantity)
  end
  @order = Order.find(order_id)
  @chep = Chep.create(customer_id: @order.customer.id,order_id: @order.id,invoice_number: @order.invoice_number)
  return true
end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit
      @credit = Credit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_params
      params.require(:credit).permit(:order_id, :value, :ctype, :status,:employee_id,:approved_by,:note_to_buyer,:requested,:extended,:utilised)
    end
end
