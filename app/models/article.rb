class Article < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_rich_text :content

  validates :title, presence: true
  validates :subtitle, presence: true
  validates :image, presence: true
end
