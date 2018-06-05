class Notification < ActiveRecord::Base
  belongs_to :customer
  belongs_to :seller
  belongs_to :order
  belongs_to :offer
  belongs_to :stock
  belongs_to :product
  belongs_to :chat
end
