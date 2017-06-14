class Link < ApplicationRecord
  # Active Record Callbacks
  before_save {self.url = self.url.downcase}

  # Active Record Validations
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  
  validates :url, presence: true, url: true, uniqueness: { case_sensitive: false }

end
