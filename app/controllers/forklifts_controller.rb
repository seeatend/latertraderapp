class ForkliftsController < ApplicationController
  before_action :set_forklift, only: [:show, :edit, :update, :destroy]

  # GET /forklifts
  # GET /forklifts.json
  def index
    @forklifts = Forklift.all
    @employee = Employee.where(:email => current_user.email).first
    
  end

  # GET /forklifts/1
  # GET /forklifts/1.json
  def show
  end

  # GET /forklifts/new
  def new
    @forklift = Forklift.new
  end

  # GET /forklifts/1/edit
  def edit
  end

  # POST /forklifts
  # POST /forklifts.json
  def create
    @forklift = Forklift.new(forklift_params)

    respond_to do |format|
      if @forklift.save
        @order = Order.find(@forklift.order_id)
      @order.update_column(:o_status,"Forklift Assigned")
        format.html { redirect_to services_path, notice: 'Forklift was successfully created.' }
        format.json { render :show, status: :created, location: @forklift }
      else
        format.html { render :new }
        format.json { render json: @forklift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forklifts/1
  # PATCH/PUT /forklifts/1.json
  def update
    respond_to do |format|
      if @forklift.update(forklift_params)
        @order = Order.find(@forklift.order_id)
        if @forklift.status == "Order Picked-Up"
      @order.update_column(:o_status,"Order Picked-Up")
    elsif @forklift.status == "Delivered"
     @chep = Chep.where(:order_id => @order.id).first
     @chep.update_column(:chep_received,forklift_params[:chep_received])

     @customer = Customer.find(@order.customer_id)
     total_chep_issued = @customer.chep_issued.to_i + @chep.chep_issued.to_i
     total_chep_received = @customer.chep_received.to_i + forklift_params[:chep_received].to_i
     total_chep_due = total_chep_issued - total_chep_received

     @customer.update_column(:chep_issued,total_chep_issued) 
     @customer.update_column(:chep_received,total_chep_received) 
     @customer.update_column(:chep_due,total_chep_due) 
      @order.update_column(:o_status,"Order Delivered")
      @current_emp = Employee.find(@forklift.employee.id)
      @current_emp.update_column(:status,"Free")
    end
        format.html { redirect_to forklifts_path, notice: 'Forklift was successfully updated.' }
        format.json { render :show, status: :ok, location: @forklift }
      else
        format.html { render :edit }
        format.json { render json: @forklift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forklifts/1
  # DELETE /forklifts/1.json
  def destroy
    @forklift.destroy
    respond_to do |format|
      format.html { redirect_to forklifts_url, notice: 'Forklift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forklift
      @forklift = Forklift.find(params[:id])
      if current_user.utype == "Employee"
        @employee = Employee.where(:email => current_user.email).first
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forklift_params
      params.require(:forklift).permit(:employee_id, :priority, :customer_id, :invoice,:order_id, :pick_up_location, :pick_up_date_and_time, :drop_location, :drop_date_and_time, :note_to_operator,:status,:image,:chep_received,:chep_issued,:chep_due)
    end
end
