class OrderedItemsController < ApplicationController
  before_action :set_ordered_item, only: [:show, :edit, :update, :destroy]

  # GET /ordered_items
  # GET /ordered_items.json
  def index
    @ordered_items = OrderedItem.all
  end

  
  # GET /ordered_items/1
  # GET /ordered_items/1.json
  def show
    @orders = Order.find(@ordered_item.order_id)
    if (current_user.utype == "Buyer")
    
     @customer = Customer.where(:uid => current_user.id).first
    
    @ordered_items = OrderedItem.where(:customer_id => @customer.id).where(:order_id => @ordered_item.order_id).where(:seller_id => @ordered_item.seller_id)
  else
 @seller = Seller.where(:uid => current_user.id).first
    
    @ordered_items = OrderedItem.where(:seller_id => @seller.id).where(:order_id => @ordered_item.order_id).where(:customer_id => @ordered_item.customer_id)
  end
end

  # GET /ordered_items/new
  def new
    @ordered_item = OrderedItem.new
  end

  # GET /ordered_items/1/edit
  def edit
  end

  # POST /ordered_items
  # POST /ordered_items.json
  def create
    @offer = Offer.find(ordered_item_params[:offer_id])
    value = @offer.selling_price * ordered_item_params[:quantity].to_i
    puts value
    @ordered_item = OrderedItem.new(ordered_item_params.merge(:value => value))

    respond_to do |format|
      if @ordered_item.save
        format.html { redirect_to @ordered_item, notice: 'Ordered item was successfully created.' }
        format.json { render :show, status: :created, location: @ordered_item }
      else
        format.html { render :new }
        format.json { render json: @ordered_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordered_items/1
  # PATCH/PUT /ordered_items/1.json
  def update
    if ordered_item_params[:o_status].present?

      if ordered_item_params[:o_status] == "Order Cancelled"
          @order = Order.find(@ordered_item.order_id)
      @order.update_column(:o_status,"Order Cancelled")
      redirect_to @ordered_item

       elsif ordered_item_params[:o_status] == "Paid"
         @order = Order.find(@ordered_item.order_id)
         
         @employee = Employee.where(:position => 'Market Staff').where(:status => 'Free').first
        
          @packing = Packing.create(employee_id: @employee.id,order_id: @order.id,status: "Assigned")
          @order.update_column(:o_status,"Paid")
          @order.update_column(:payment_done_date,DateTime.now)
        redirect_to @ordered_item

      elsif ordered_item_params[:o_status] == "Order Approved"
       @order = Order.find(@ordered_item.order_id)
       ordered_items = OrderedItem.where(:order_id => @order.id)
       if @order.payment_type == "Cash"
        @notification = Notification.create(customer_id: @ordered_item.customer_id, seller_id: @ordered_item.seller_id, order_id: @ordered_item.order_id, content: "Make payment cash payment for your approved order " + @ordered_item.offer.desc, ntype: "Payment" )
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


        ordered_items = OrderedItem.where(:order_id => @order.id)
        @customer = Customer.find(ordered_items.first.customer_id)
      if @customer.coop_credit_available.present?
          if ordered_items.sum('value') <=  @customer.coop_credit_available
            @credit = Credit.create(order_id: @order.id,value: ordered_items.sum('value'),utilised: ordered_items.sum('value'),extended: 0,requested: 0, ctype: @order.payment_type,status: 'Approved',approved_by: 'Auto')
             @credit.order.update_column(:o_status,"Credit Approved")
             @credit.order.update_column(:paid_amount, @credit.value)
             
             @credit.order.update_column(:payment_confirmed_by ,"Confirmed By System")
             @credit.order.update_column(:note_to_buyer , "Approved By System")
             @credit.order.update_column(:order_approved_date,DateTime.now)
             credit_utilized = @customer.coop_credit_utilized.to_f + ordered_items.sum('value').to_f
             credit_available = @customer.coop_credit_available.to_f - ordered_items.sum('value').to_f

             puts credit_available
             puts credit_available

             @customer.update_column(:coop_credit_available,credit_available)
             @customer.update_column(:coop_credit_utilized,credit_utilized)
             @customer.update_column(:coop_credit_due,credit_utilized)

             @employee = Employee.where(:position => 'Market Staff').where(:status => 'Free').first
             @packing = Packing.create(employee_id: @employee.id,order_id: @order.id,status: "Assigned")
             @credit.order.update_column(:o_status,"Packing Under Process")
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
            @credit.order.update_column(:order_approved_date,DateTime.now)
            
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


        ordered_items = OrderedItem.where(:order_id => @order.id)
        @customer = Customer.find(ordered_items.first.customer_id)
      if @customer.credit_limit.present?
          if ordered_items.sum('value') <=  @customer.credit_available
            @credit = Credit.create(order_id: @order.id,value: ordered_items.sum('value'),utilised: ordered_items.sum('value'),extended: 0,requested: 0, ctype: @order.payment_type,status: 'Approved',approved_by: 'Auto')
             @credit.order.update_column(:o_status,"Credit Approved")
             @credit.order.update_column(:paid_amount, @credit.value)
             
             @credit.order.update_column(:payment_confirmed_by ,"Confirmed By System")
             @credit.order.update_column(:note_to_buyer , "Approved By System")
             @credit.order.update_column(:order_approved_date,DateTime.now)
             credit_utilized = @customer.credit_utilized.to_f + ordered_items.sum('value').to_f
             credit_available = @customer.credit_available.to_f - ordered_items.sum('value').to_f

             @customer.update_column(:credit_available,credit_available)
             @customer.update_column(:credit_utilized,credit_utilized)
             @customer.update_column(:credit_due,credit_utilized)

             @employee = Employee.where(:position => 'Market Staff').where(:status => 'Free').first
             @packing = Packing.create(employee_id: @employee.id,order_id: @order.id,status: "Assigned")
             @credit.order.update_column(:o_status,"Packing Under Process")
             @employee.update_column(:status,'Assigned')
             deduct_from_offer(@order.id)
             redirect_to @ordered_item
          else
            credit_to_be_approved =  ordered_items.sum('value').to_f -  @customer.credit_available.to_f
            credit_utilized = @customer.credit_utilized.to_f + @customer.credit_available.to_f
            credit_available = 0
            @credit = Credit.create(order_id: @order.id,value: ordered_items.sum('value'),utilised: @customer.credit_available.to_f,extended: 0,requested: credit_to_be_approved,ctype: @order.payment_type)
            @customer.update_column(:credit_available,credit_available)
            @customer.update_column(:credit_utilized,credit_utilized)
            @customer.update_column(:credit_due,credit_utilized)
            @credit.order.update_column(:order_approved_date,DateTime.now)
            
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

    elsif ordered_item_params[:o_status] == "Receieved"
        @order = Order.find(@ordered_item.order_id)
        @customer = Customer.find(@ordered_item.customer_id)
      @order.update_column(:o_status,"Order Receieved")
      @order.update_column(:item_received_date,DateTime.now)
      @order.update_column(:item_recevied_by_name,@customer.business_name)
      @order.update_column(:item_received_by_number,@customer.mobile)
     
      redirect_to @ordered_item

elsif ordered_item_params[:o_status] == "Credit Payment Done"
        @order = Order.find(@ordered_item.order_id)
        
      @order.update_column(:o_status,"Credit Payment Done")
      @order.update_column(:payment_done_date,DateTime.now)
    
     
      redirect_to @ordered_item
    elsif ordered_item_params[:o_status] == "Shipped"
       @order = Order.find(@ordered_item.order_id)
      @order.update_column(:o_status,"Shipped")
      @order.update_column(:consignment_number,ordered_item_params[:consignment_number])
      @order.update_column(:transport_contact_name ,ordered_item_params[:transport_contact_name])
      @order.update_column(:transport_contact_number ,ordered_item_params[:transport_contact_number])
      @order.update_column(:note_to_buyer ,ordered_item_params[:note_to_buyer])
      @order.update_column(:item_shipped_date,DateTime.now)
      redirect_to @ordered_item

    elsif ordered_item_params[:o_status] == "Closed"
       @order = Order.find(@ordered_item.order_id)
      @order.update_column(:o_status,"Closed")
  
      @order.update_column(:closed_date,DateTime.now)
      redirect_to @ordered_item

    else
      @order = Order.find(@ordered_item.order_id)
      @order.update_column(:o_status,"Closed")
      @order.update_column(:closed_date,DateTime.now)
      
          redirect_to @ordered_item
   end
    else 
      respond_to do |format|
      if @ordered_item.update(ordered_item_params)
        format.html { redirect_to @ordered_item, notice: 'Ordered item was successfully updated.' }
        format.json { render :show, status: :ok, location: @ordered_item }
      else
        format.html { render :edit }
        format.json { render json: @ordered_item.errors, status: :unprocessable_entity }
      end
    end
    end
    
  end

  # DELETE /ordered_items/1
  # DELETE /ordered_items/1.json
  def destroy
    @ordered_item.destroy
    respond_to do |format|
      format.html { redirect_to ordered_items_url, notice: 'Ordered item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve_order
  end




def deduct_from_offer(order_id)
  @deditems = OrderedItem.where(:order_id => order_id)
  @deditems.each do |oitem|
    offer = Offer.find(oitem.offer_id)
    new_offer_quantity  = offer.total_quantity_on_offer.to_i - oitem.quantity.to_i
    new_sold_quantity = offer.stock.sold.to_i + oitem.quantity.to_i
    new_offered_quantity = offer.stock.offered.to_i - oitem.quantity.to_i
    offer.update_column(:total_quantity_on_offer,new_offer_quantity)
    offer.stock.update_column(:sold,new_sold_quantity)
    offer.stock.update_column(:offered,new_offered_quantity)
  end
  @order = Order.find(order_id)
  @chep = Chep.create(customer_id: @order.customer.id,order_id: @order.id,invoice_number: @order.invoice_number)
  return true
end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordered_item
      @ordered_item = OrderedItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordered_item_params
      params.require(:ordered_item).permit(:order_id, :customer_id, :seller_id, :offer_id, :quantity,:value,:o_status,:consignment_number,:transport_contact_name,:transport_contact_number,:note_to_buyer,:payment_done_date, :payment_confirmed_by,:paid_amount,:quantity,:closed_date)
    end
end
