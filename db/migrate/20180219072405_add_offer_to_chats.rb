class AddOfferToChats < ActiveRecord::Migration
  def change
    add_reference :chats, :offer, index: true, foreign_key: true
  end
end
