class Photo < ApplicationRecord
  belongs_to :missing_item
  has_one_attached :photo
end
