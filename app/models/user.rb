class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, length: { maximum: 10 }
  validates :email, uniqueness: true
  # validates :password,
  # format: {
  #   with: /\A[a-zA-Z0-9]+\z/
  # }

  has_many :likes, dependent: :destroy
  has_many :like_groups, through: :likes, source: :group
  has_many :wents, dependent: :destroy
  has_many :went_groups, through: :wents, source: :group
  has_many :comments

  mount_uploader :image, ImageUploader
end
