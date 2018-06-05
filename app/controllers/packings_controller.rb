class PackingsController < ApplicationController
  before_action :set_packing, only: [:show, :edit, :update, :destroy]

  # GET /packings
  # GET /packings.json
  def index
     if current_user.utype == "Employee"
  @employee = Employee.where(:email => current_user.email).first
    @packings = Packing.all
  else
    @packings = Packing.all
  end
  end

  # GET /packings/1
  # GET /packings/1.json
  def show
  end

  # GET /packings/new
  def new
    @packing = Packing.new
  end

  # GET /packings/1/edit
  def edit
    @employee = Employee.where(:email => current_user.email).first
  end

  # POST /packings
  # POST /packings.json
  def create
    @packing = Packing.new(packing_params)

    respond_to do |format|
      if @packing.save
          if packing_params[:status] == "Assigned"
            @order = Order.find(@packing.order_id)
      @order.update_column(:o_status,"Packing Under Process")
          else
             @order = Order.find(@packing.order_id)
      @order.update_column(:o_status,"Packing Done")
          end
        format.html { redirect_to sales_path, notice: 'Packing was successfully created.' }
        format.json { render :show, status: :created, location: @packing }
      else
        format.html { render :new }
        format.json { render json: @packing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packings/1
  # PATCH/PUT /packings/1.json
  def update

    respond_to do |format|
      if @packing.update(packing_params)
        if packing_params[:status] == "Assigned"
            @order = Order.find(@packing.order_id)
      @order.update_column(:o_status,"Packing Under Process")
          elsif packing_params[:status] == "Packed"
             @order = Order.find(@packing.order_id)
             @chep = Chep.where(:order_id => @order.id).first
             puts @packing.chep_issued
             @chep.update_column(:chep_issued,packing_params[:chep_issued])
              @order.update_column(:o_status,"Packed")
              @current_emp = Employee.find(@packing.employee.id)
             @current_emp.update_column(:status,"Free")

             elsif packing_params[:status] == "Assign-Forklift"
               @order = Order.find(@packing.order_id)
             @chep = Chep.where(:order_id => @order.id).first
             puts @packing.chep_issued
             @chep.update_column(:chep_issued,packing_params[:chep_issued])

             @employee = Employee.where(:position => 'Forklift').where(:status => 'Free').first
             @forklift = Forklift.create(employee_id: @employee.id,priority: 'Urgent',customer_id: @order.customer_id,invoice: @order.invoice_number,order_id: @order.id,pick_up_location: @order.pick_up_point,drop_location: @order.drop_off_point,status: 'Assigned' )
             @order.update_column(:o_status,"Forklift Assigned")
             @current_emp = Employee.find(@packing.employee.id)
             @current_emp.update_column(:status,"Free")
      
          end
        format.html { redirect_to packings_path, notice: 'Packing was successfully updated.' }
        format.json { render :show, status: :ok, location: @packing }
      else
        format.html { render :edit }
        format.json { render json: @packing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packings/1
  # DELETE /packings/1.json
  def destroy
    @packing.destroy
    respond_to do |format|
      format.html { redirect_to packings_url, notice: 'Packing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_packing
      @packing = Packing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def packing_params
      params.require(:packing).permit(:employee_id, :order_id, :status,:idlestatus,:pallet_type,:chep_issued,:chep_due,:priority,:pickupdate,:dropoffdate,:note_to_forklift,:assign_to,:pick_up_point,:drop_off_point)
    end
end
