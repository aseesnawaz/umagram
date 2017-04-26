class Comment < ApplicationRecord
  validates :body, :post_id, :user_id, presence: true
end
