class Tag < ApplicationRecord
  has_many :groups, throgh: :group_tags
  has_many :group_tags
end
