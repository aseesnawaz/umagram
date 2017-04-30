class Post < ApplicationRecord
  validates :image, :user_id, presence: true

  mount_uploader :image, ImageUploader

  has_many :comments

  def like(user_id)
    self.likes = self.likes.to_i + 1
    self.save!
  end
end
