class Question < ApplicationRecord

  # Active Record Associations
  belongs_to :user
  has_many :comments, as: :commentable
end
