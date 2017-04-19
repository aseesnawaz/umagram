class Comment < ApplicationRecord
  validates :body, :post_id, presence: true
end
