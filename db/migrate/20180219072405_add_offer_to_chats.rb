class AddOfferToChats < ActiveRecord::Migration[5.2]
  def change
    add_reference :chats, :offer, index: true, foreign_key: true
  end
end
