class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }
  validates :pictures, presence: true
  mount_uploaders :pictures, PictureUploader
end
