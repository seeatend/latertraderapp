class B2bOrderedItemsController < ApplicationController
  before_action :set_b2b_ordered_item, only: [:show, :edit, :update, :destroy]

  # GET /b2b_ordered_items
  # GET /b2b_ordered_items.json
  def index
    @b2b_ordered_items = B2bOrderedItem.all
  end

  # GET /b2b_ordered_items/1
  # GET /b2b_ordered_items/1.json
  def show
    @orders = B2bOrder.find(@ordered_item.b2b_order_id)
    
 @seller = Seller.where(:uid => current_user.id).first
    
    @ordered_items = B2bOrderedItem.where(:seller_id => @seller.id).where(:b2b_order_id =>  @ordered_item.b2b_order_id)
  
  end

  # GET /b2b_ordered_items/new
  def new
    @b2b_ordered_item = B2bOrderedItem.new
  end

  # GET /b2b_ordered_items/1/edit
  def edit
  end

  # POST /b2b_ordered_items
  # POST /b2b_ordered_items.json
  def create
     @offer = Offer.find(b2b_ordered_item_params[:offer_id])
    value = @offer.selling_price * b2b_ordered_item_params[:quantity].to_i
    puts value
    
    @b2b_ordered_item = B2bOrderedItem.new(b2b_ordered_item_params.merge(:value => value))

    respond_to do |format|
      if @b2b_ordered_item.save
        format.html { redirect_to @b2b_ordered_item, notice: 'B2b ordered item was successfully created.' }
        format.json { render :show, status: :created, location: @b2b_ordered_item }
      else
        format.html { render :new }
        format.json { render json: @b2b_ordered_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /b2b_ordered_items/1
  # PATCH/PUT /b2b_ordered_items/1.json
  def update
     if b2b_ordered_item_params[:o_status].present?

      if b2b_ordered_item_params[:o_status] == "Order Cancelled"
          @order = B2bOrder.find(@ordered_item.b2b_order_id)
      @order.update_column(:o_status,"Order Cancelled")
      redirect_to @ordered_item

       elsif b2b_ordered_item_params[:o_status] == "Paid"
         @order = B2bOrder.find(@ordered_item.b2b_order_id)
         
         @employee = Employee.where(:position => 'Market Staff').where(:status => 'Free').first
        
          @packing = Packing.create(employee_id: @employee.id,order_id: @order.id,status: "Assigned")
          @order.update_column(:o_status,"Paid")
          @order.update_column(:payment_done_date,DateTime.now)
        redirect_to @ordered_item

      elsif b2b_ordered_item_params[:o_status] == "Order Approved"
       @order = B2bOrder.find(@ordered_item.b2b_order_id)
       ordered_items = B2bOrderedItem.where(:b2b_order_id => @order.id)
       if @order.payment_type == "Cash"
        
        if @order.shipping_type == "Market Drop-Off"
           deduct_from_offer(@order.id)
           @order.update_column(:o_status,"Approved")
           @order.update_column(:order_approved_date,DateTime.now)
           redirect_to @ordered_item


           elsif @order.shipping_type == "Shipping"
           deduct_from_offer(@order.id)
           @order.update_column(:o_status,"Approved")
           @order.update_column(:order_approved_date,DateTime.now)
           redirect_to @ordered_item

           elsif @order.shipping_type == "Pick up at Stand"
           deduct_from_offer(@order.id)
           @order.update_column(:o_status,"Approved")
           @order.update_column(:order_approved_date,DateTime.now)
           redirect_to @ordered_item
        else

        deduct_from_offer(@order.id)
        @order.update_column(:o_status,"Payment Done")
        @order.update_column(:order_approved_date,DateTime.now)
        redirect_to @ordered_item
      end
   
    elsif @order.payment_type == "Credit Co-OP"


        ordered_items = B2bOrderedItem.where(:order_id => @order.id)
        @customer = Seller.find(ordered_items.first.poi_id)
      if @customer.coop_credit_available.present?
          if ordered_items.sum('value') <=  @customer.coop_credit_available
            @credit = Credit.create(order_id: @order.id,value: ordered_items.sum('value'),utilised: ordered_items.sum('value'),extended: 0,requested: 0, ctype: "B2B Sales",status: 'Approved',approved_by: 'Auto')
             @order.update_column(:o_status,"Credit Approved")
             @order.update_column(:paid_amount, @credit.value)
             
             @order.update_column(:payment_confirmed_by ,"Confirmed By System")
             @order.update_column(:note_to_buyer , "Approved By System")
             @order.update_column(:order_approved_date,DateTime.now)
             credit_utilized = @customer.coop_credit_utilized.to_f + ordered_items.sum('value').to_f
             credit_available = @customer.coop_credit_available.to_f - ordered_items.sum('value').to_f

             puts credit_available
             puts credit_available

             @customer.update_column(:coop_credit_available,credit_available)
             @customer.update_column(:coop_credit_utilized,credit_utilized)
             @customer.update_column(:coop_credit_due,credit_utilized)

             @employee = Employee.where(:position => 'Market Staff').where(:status => 'Free').first
             @packing = Packing.create(employee_id: @employee.id,order_id: @order.id,status: "Assigned")
             @order.update_column(:o_status,"Packing Under Process")
             @employee.update_column(:status,'Assigned')
             deduct_from_offer(@order.id)
             redirect_to @ordered_item
          else
            credit_to_be_approved =  ordered_items.sum('value').to_f -  @customer.coop_credit_available.to_f
            credit_utilized = @customer.coop_credit_utilized.to_f + @customer.coop_credit_available.to_f
            credit_available = 0


            puts credit_to_be_approved
            puts credit_utilized 
            puts @customer.coop_credit_available.to_f
            @credit = Credit.create(order_id: @order.id,value: ordered_items.sum('value'),utilised: @customer.coop_credit_available.to_f,extended: 0,requested: credit_to_be_approved,ctype: @order.payment_type)
            @customer.update_column(:coop_credit_available,credit_available)
            @customer.update_column(:coop_credit_utilized,credit_utilized)
            @customer.update_column(:coop_credit_due,credit_utilized)
            @order.update_column(:order_approved_date,DateTime.now)
            
            @order.update_column(:o_status,"Pending Approval")
            redirect_to @ordered_item
          end

     else
          @credit = Credit.create(order_id: @order.id,value: ordered_items.sum('value'),ctype: @order.payment_type)
          @order.update_column(:o_status,"Pending Approval")
          @order.update_column(:order_approved_date,DateTime.now)
          redirect_to @ordered_item
  end

    elsif @order.payment_type == "Seller Credit"


        ordered_items = B2bOrderedItem.where(:order_id => @order.id)
        @customer = Seller.find(ordered_items.first.poi_id)
      if @customer.credit_limit.present?
          if ordered_items.sum('value') <=  @customer.credit_available
            @credit = Credit.create(order_id: @order.id,value: ordered_items.sum('value'),utilised: ordered_items.sum('value'),extended: 0,requested: 0, ctype: "B2B Sales",status: 'Approved',approved_by: 'Auto')
             @order.update_column(:o_status,"Credit Approved")
             @order.update_column(:paid_amount, @credit.value)
             
             @order.update_column(:payment_confirmed_by ,"Confirmed By System")
             @order.update_column(:note_to_buyer , "Approved By System")
             @order.update_column(:order_approved_date,DateTime.now)
             credit_utilized = @customer.credit_utilized.to_f + ordered_items.sum('value').to_f
             credit_available = @customer.credit_available.to_f - ordered_items.sum('value').to_f

             @customer.update_column(:credit_available,credit_available)
             @customer.update_column(:credit_utilized,credit_utilized)
             @customer.update_column(:credit_due,credit_utilized)

             @employee = Employee.where(:position => 'Market Staff').where(:status => 'Free').first
             @packing = Packing.create(employee_id: @employee.id,order_id: @order.id,status: "Assigned")
             @order.update_column(:o_status,"Packing Under Process")
             @employee.update_column(:status,'Assigned')
             deduct_from_offer(@order.id)
             redirect_to @ordered_item
          else
            credit_to_be_approved =  ordered_items.sum('value').to_f -  @customer.credit_available.to_f
            credit_utilized = @customer.credit_utilized.to_f + @customer.credit_available.to_f
            credit_available = 0
            @credit = Credit.create(order_id: @order.id,value: ordered_items.sum('value'),utilised: @customer.credit_available.to_f,extended: 0,requested: credit_to_be_approved,ctype: "B2B Sales")
            @customer.update_column(:credit_available,credit_available)
            @customer.update_column(:credit_utilized,credit_utilized)
            @customer.update_column(:credit_due,credit_utilized)
            @order.update_column(:order_approved_date,DateTime.now)
            
            @order.update_column(:o_status,"Pending Approval")
            redirect_to @ordered_item
          end

     else
          @credit = Credit.create(order_id: @order.id,value: ordered_items.sum('value'),ctype: @order.payment_type)
          @order.update_column(:o_status,"Pending Approval")
          @order.update_column(:order_approved_date,DateTime.now)
          redirect_to @ordered_item
  end

    else
      @order.update_column(:o_status,"Order Approved")
      deduct_from_offer(@order.id)
      @order.update_column(:order_approved_date,DateTime.now)
      redirect_to @ordered_item
    end

    elsif b2b_ordered_item_params[:o_status] == "Receieved"
        @order = B2bOrder.find(@ordered_item.b2b_order_id)
         @customer = Seller.find(ordered_items.first.poi_id)
      @order.update_column(:o_status,"Order Receieved")
      @order.update_column(:item_received_date,DateTime.now)
      @order.update_column(:item_recevied_by_name,@customer.business_name)
      @order.update_column(:item_received_by_number,@customer.mobile)
     
      redirect_to @ordered_item

elsif ordered_item_params[:o_status] == "Credit Payment Done"
        @order = B2bOrder.find(@ordered_item.b2b_order_id)
        
      @order.update_column(:o_status,"Credit Payment Done")
      @order.update_column(:payment_done_date,DateTime.now)
    
     
      redirect_to @ordered_item
    elsif ordered_item_params[:o_status] == "Shipped"
       @order = B2bOrder.find(@ordered_item.b2b_order_id)
      @order.update_column(:o_status,"Shipped")
      @order.update_column(:consignment_number,ordered_item_params[:consignment_number])
      @order.update_column(:transport_contact_name ,ordered_item_params[:transport_contact_name])
      @order.update_column(:transport_contact_number ,ordered_item_params[:transport_contact_number])
      @order.update_column(:note_to_buyer ,ordered_item_params[:note_to_buyer])
      @order.update_column(:item_shipped_date,DateTime.now)
      redirect_to @ordered_item

    elsif ordered_item_params[:o_status] == "Closed"
       @order = B2bOrder.find(@ordered_item.b2b_order_id)
      @order.update_column(:o_status,"Closed")
  
      @order.update_column(:closed_date,DateTime.now)
      redirect_to @ordered_item

    else
      @order = B2bOrder.find(@ordered_item.b2b_order_id)
      @order.update_column(:o_status,"Closed")
      @order.update_column(:closed_date,DateTime.now)
      
          redirect_to @ordered_item
   end
    else 
      respond_to do |format|
      if @b2b_ordered_item.update(b2b_ordered_item_params)
        format.html { redirect_to @b2b_ordered_item, notice: 'B2b ordered item was successfully updated.' }
        format.json { render :show, status: :ok, location: @b2b_ordered_item }
      else
        format.html { render :edit }
        format.json { render json: @b2b_ordered_item.errors, status: :unprocessable_entity }
      end
    end
    end
    

    
  end

def deduct_from_offer(order_id)
  @deditems = B2bOrderedItem.where(:b2b_order_id => order_id)
  @deditems.each do |oitem|
    offer = Offer.find(oitem.offer_id)
    new_offer_quantity  = offer.total_quantity_on_offer.to_i - oitem.quantity.to_i
    new_sold_quantity = offer.stock.sold.to_i + oitem.quantity.to_i
    new_offered_quantity = offer.stock.offered.to_i - oitem.quantity.to_i
    offer.update_column(:total_quantity_on_offer,new_offer_quantity)
    offer.stock.update_column(:sold,new_sold_quantity)
    offer.stock.update_column(:offered,new_offered_quantity)
  end
  
  
  return true
end 

  # DELETE /b2b_ordered_items/1
  # DELETE /b2b_ordered_items/1.json
  def destroy
    @b2b_ordered_item.destroy
    respond_to do |format|
      format.html { redirect_to b2b_ordered_items_url, notice: 'B2b ordered item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_b2b_ordered_item
      @ordered_item = B2bOrderedItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def b2b_ordered_item_params
      params.require(:b2b_ordered_item).permit(:b2b_order_id, :seller_id, :poi_id, :offer_id, :quantity, :value, :o_status,:in_network_of,:credit_limit,:credit_utilized,:credit_available,:credit_due,:credit_type,:Coop_type,:Coop_ref_no,:credit_terms,:coop_credit,:coop_credit_limit,:coop_credit_utilized,:coop_credit_available,:coop_credit_due,:chep_issued,:chep_due,:chep_received,:in_chep_network_of)
    end
end
