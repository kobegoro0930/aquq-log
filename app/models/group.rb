class Group < ApplicationRecord
  # belongs_to :user
  has_many :saves
  # has_many :group_tags
  # has_many :tags, throgh: :group_tags
  has_many :images
  has_many :comments
  has_many :wents, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  def self.search(search)
    return Group.all() unless search
    Group.where('area LIKE(?)', "%#{search}%")
  end
end
