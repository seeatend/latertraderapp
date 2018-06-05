class Forklift < ActiveRecord::Base
  belongs_to :employee
  belongs_to :customer
  belongs_to :order

  
end
