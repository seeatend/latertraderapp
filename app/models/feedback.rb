class Feedback < ActiveRecord::Base
  belongs_to :seller
  belongs_to :customer
end
