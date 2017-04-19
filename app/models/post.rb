class Post < ApplicationRecord
  validates :image, :user_id, presence: true

  has_many :comments
end
