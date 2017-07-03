class Comment < ApplicationRecord
  # Active Record Associations
  belongs_to :commentable, polymorphic: true, counter_cache: true # counter_cache belongs on child model because that's the trigger action on link.upvote_count
  belongs_to :user

  # Active Record Validations
  validates :body, presence: true
end
