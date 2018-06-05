class Grower < ActiveRecord::Base
	has_many :supplies, dependent: :delete_all
end
