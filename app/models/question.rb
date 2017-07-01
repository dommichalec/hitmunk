class Question < ApplicationRecord

  # Active Record Associations
  belongs_to :user
  has_many :comments, as: :commentable

  # Active Record Validations
  validates :title, presence: true, length: { maximum: 75 }
  validates :body, presence: true, length: { maximum: 200 }
end
