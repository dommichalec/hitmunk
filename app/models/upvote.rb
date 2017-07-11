class Upvote < ApplicationRecord
  # Active Record Associations
  belongs_to :link, counter_cache: true # counter_cache belongs on child model because that's the trigger action on object.upvotes_count
  belongs_to :user

  # Active Record Validations
  validates :user_id, :link_id, presence: true
end
