class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :missing_item
end
