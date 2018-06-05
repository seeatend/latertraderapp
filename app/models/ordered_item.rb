class OrderedItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :customer
  belongs_to :seller
  belongs_to :offer
end
