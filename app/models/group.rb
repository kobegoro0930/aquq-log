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

  # def self.search(area,text)
  #   return Group.all unless search
  #   Group.where('area LIKE(?)', "%#{area}%").where('text LIKE(?)', "%#{text}%")
  # end

  scope :search, -> (search_params) do
    return if search_params.blank?

    area_like(search_params[:area]).text_like(search_params[:text])
      
  end
  scope :area_like, -> (area) { where('area LIKE ?', "%#{area}%") if area.present? }
  scope :text_like, -> (text) { where('text LIKE ?', "%#{text}%") if text.present? }
  
end
