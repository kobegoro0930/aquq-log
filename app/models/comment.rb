class Comment < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :user

  validates :title, presence: true
  validates :text, presence: true
end
