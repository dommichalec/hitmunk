class Comment < ApplicationRecord
  # Active Record Associations
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  # Active Record Validations
  validates :body, presence: true
end
