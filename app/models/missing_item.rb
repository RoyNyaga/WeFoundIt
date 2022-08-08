class MissingItem < ApplicationRecord
  belongs_to :user
  has_many :photos
  before_create :set_missing_status

  def set_missing_status
    self.is_missing = true
  end
end
