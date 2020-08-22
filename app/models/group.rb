class Group < ApplicationRecord
  # belongs_to :user
  has_many :saves
  # has_many :group_tags
  # has_many :tags, throgh: :group_tags
  has_many :images
  has_many :comments
  has_many :wents, dependent: :destroy
  def went_user(user_id)
    wents.find_by(user_id: user_id)
  end

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
end
