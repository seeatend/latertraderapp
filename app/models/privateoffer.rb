class Privateoffer < ActiveRecord::Base
  belongs_to :offer
  belongs_to :customer
  belongs_to :seller
end
