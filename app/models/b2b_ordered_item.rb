class B2bOrderedItem < ActiveRecord::Base
  belongs_to :b2b_order
  belongs_to :seller
  belongs_to :offer
end
