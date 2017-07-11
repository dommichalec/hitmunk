class Comment < ApplicationRecord
  # Active Record Associations
  belongs_to :commentable, polymorphic: true, counter_cache: true # counter_cache belongs on child model because that's the trigger action on object.comments_count
  belongs_to :user

  # Active Record Validations
  validates :body, presence: true

  # refactor this into a scope
  def self.sort_by_created_at
    self.order('created_at desc')
  end
end
