class Link < ApplicationRecord
  # Active Record Callbacks
  before_save { self.url = self.url.downcase }
  before_save :update_slug

  # Active Record Associations
  belongs_to :user
  has_many :upvotes, dependent: :destroy
  has_many :users_who_upvoted, through: :upvotes, source: :user
  has_many :comments, as: :commentable

  # Active Record Validations
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :url, presence: true, url: true, uniqueness: { case_sensitive: false }

  # refactor this into a scope later
  def self.order_by_popularity
    self.order('upvotes_count + comments_count desc')
  end

  # instance methods
  def already_liked_by?(user)
    users_who_upvoted.include? user
  end

  def update_slug
    self.slug = title.parameterize
  end

  def to_param
    slug
  end
end
