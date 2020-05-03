class Post < ApplicationRecord
  validates :title, :content, presence: true
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments, dependent: :destroy
end
