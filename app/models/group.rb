class Group < ApplicationRecord
  belongs_to :user
  has_many :saves
  has_many :groups_tags
  has_many :tags, throgh: :groups_tags
  has_many :images
  has_many :comments
  has_many :wents
end
