class DeviseAuthyAddToSellers < ActiveRecord::Migration
  def self.up
    change_table :sellers do |t|
      t.string    :authy_id
      t.datetime  :last_sign_in_with_authy
      t.boolean   :authy_enabled, :default => false
    end

    add_index :sellers, :authy_id
  end

  def self.down
    change_table :sellers do |t|
      t.remove :authy_id, :last_sign_in_with_authy, :authy_enabled
    end
  end
end

