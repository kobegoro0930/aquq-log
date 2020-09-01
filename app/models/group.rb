class Group < ApplicationRecord
  # belongs_to :user
  has_many :saves
  has_many :images
  has_many :comments
  has_many :wents, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
end
