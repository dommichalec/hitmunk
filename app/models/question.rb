class Question < ApplicationRecord
  before_save :update_slug


  # Active Record Associations
  belongs_to :user
  has_many :comments, as: :commentable

  # Active Record Validations
  validates :title, presence: true, length: { maximum: 200 }
  validates :body, presence: true, length: { maximum: 400 }

  # refactor this into a scope later
  def self.order_by_popularity
    self.order('comments_count desc')
  end

end
