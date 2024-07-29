class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 300 }
  validates :body, presence: true, length: { maximum: 40_000 }
end
