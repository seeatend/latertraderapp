class Supply < ActiveRecord::Base
mount_uploader :image, ImageUploader
  belongs_to :grower
  belongs_to :employee

  
end
