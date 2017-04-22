class Post < ApplicationRecord
  validates :image, :user_id, presence: true

  mount_uploader :image, ImageUploader

  has_many :comments
end
