class Item < ApplicationRecord
  belongs_to :user
  has_many :images
  validates :name, :description, :price, presence: true
end
