class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true
  validates :email, uniqueness: true
  validates :password,
  format: {
    with: /\A[a-zA-Z0-9]+\z/
  }

  has_many :saves, dependent: :destroy
  has_many :wents, dependent: :destroy
  has_many :comments
end
