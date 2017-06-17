class Upvote < ApplicationRecord
  belongs_to :link
  belongs_to :user
end
