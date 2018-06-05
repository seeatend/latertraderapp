class Credit < ActiveRecord::Base
  belongs_to :order
  belongs_to :employee
end
