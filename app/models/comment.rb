class Comment < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :user

  validates :title, presence: true, length: { maximum: 20 }
  validates :text, presence: true, length: { maximum: 140 }
  validates :visit_date, presence: true
end
