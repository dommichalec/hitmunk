class Upvote < ApplicationRecord
  # Active Record Associations
  belongs_to :link
  belongs_to :user

  # Active Record Validations
  validates :user_id, :link_id, presence: true
end
