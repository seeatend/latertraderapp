class Supply < ActiveRecord::Base
has_one_attached :image
  belongs_to :grower
  belongs_to :employee

  
end
