class Item < ApplicationRecord
  belongs_to :user
  validates :name, :image, :description, :price, presence: true
  
  mount_uploader :image, ImageUploader
end
