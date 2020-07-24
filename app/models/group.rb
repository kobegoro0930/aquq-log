class Group < ApplicationRecord
  # belongs_to :user
  has_many :saves
  # has_many :group_tags
  # has_many :tags, throgh: :group_tags
  has_many :images
  has_many :comments
  has_many :wents
end
