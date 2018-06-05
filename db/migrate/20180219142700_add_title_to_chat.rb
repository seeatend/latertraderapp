class AddTitleToChat < ActiveRecord::Migration
  def change
    add_column :chats, :title, :string
  end
end
