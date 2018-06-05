class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :edit, :update, :destroy]

  # GET /chats
  # GET /chats.json
  def index

    if (current_user.utype == "Seller")

@chats = Chat.where(:seller_id => Seller.where(:uid => current_user.id).first.id)

if @chats.present?
    @currentchat = @chats.first
    @messages = Message.where(:chat_id => @currentchat.id)

    @newmessage = Message.new

  else 

  end 
    else

@chats = Chat.where(:customer_id => Customer.where(:uid => current_user.id).first.id)
if @chats.present?
    @currentchat = @chats.first
    @messages = Message.where(:chat_id => @currentchat.id)

    @newmessage = Message.new
  else 
  end
    end

    
  end

  # GET /chats/1
  # GET /chats/1.json
  def show
    if (current_user.utype == "Seller")
@messages = Message.where(:chat_id => @chat.id)
    @chats = Chat.where(:seller_id => @chat.seller_id)
    @newmessage = Message.new
    else
@messages = Message.where(:chat_id => @chat.id)
    @chats = Chat.where(:customer_id => @chat.customer_id)
    @newmessage = Message.new
    end
    
  end

  # GET /chats/new
  def new
    @customer = Customer.find(params[:customer_id])
    @seller = Seller.find(params[:seller_id])
    @offer = Offer.find(params[:offer_id])
    @chat = Chat.new
  end

  def customer_message
  end 

  def seller_message
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats
  # POST /chats.json
  def create
    @chat = Chat.new(chat_params)

    respond_to do |format|
      if @chat.save
        @messages = Message.create(chat_id: @chat.id,content: chat_params[:message],ctype: current_user.utype)
        @notification = Notification.create(customer_id: @chat.customer_id, seller_id: @chat.seller_id, chat_id: @chat.id, content: @chat.customer.business_name + "started a chat on your offer " + Offer.find(@chat.offer_id).desc, ntype: "Chat" )
        format.html { redirect_to @chat, notice: 'Chat was successfully created.' }
        format.json { render :show, status: :created, location: @chat }
      else
        format.html { render :new }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chats/1
  # PATCH/PUT /chats/1.json
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to @chat, notice: 'Chat was successfully updated.' }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1
  # DELETE /chats/1.json
  def destroy
    @chat.destroy
    respond_to do |format|
      format.html { redirect_to chats_url, notice: 'Chat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_params
      params.require(:chat).permit(:order_id, :customer_id, :seller_id, :message,:offer_id,:title)
    end
end
