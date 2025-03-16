class Entry < ApplicationRecord
  belongs_to :place
  belongs_to :user
  has_one_attached :image
  has_one_attached :uploaded_image

  validates :title, :description, :occurred_on, presence: true
end
