class ClaimWastage < ActiveRecord::Base
  belongs_to :stock
  belongs_to :employee
end
