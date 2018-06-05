class ProductRequest < ActiveRecord::Base
  belongs_to :seller
  belongs_to :product
end
