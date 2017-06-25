class User < ApplicationRecord
  has_secure_password # gives us self.password=() and self.password_confirmation=()
  # Active Record Callbacks
  before_save { self.email = self.email.downcase.strip }
  before_validation { self.username = self.username.strip }
  before_save :update_slug

  # Mailboxer methods
  acts_as_messageable

  def mailboxer_email(user)
    return email
  end

  # Active Record Associations
  has_many :links
  has_many :upvotes, dependent: :destroy
  has_many :upvoted_links, through: :upvotes, source: :link

  # Active Record Validations
  validates :username, presence: true, uniqueness: { case_sensitive: false },
            format: { without: /\s/, message: "cannot contain spaces (but can contain numbers, letters, and special characters like !@#_$%^&*-()" },
            length: { minimum: 3 }

  validates :email, presence: true, length: { in: 1..255 },
            format: { with: ApplicationRecord::VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false } # case doesn't matter here

  validates :password, presence: true,
            length: { minimum: 6 }, allow_nil: true, # allows for blank password
            # and password_confirmation for updating users
            format: { without: /\s/, message: "cannot contain spaces (but can contain numbers, letters, and special characters like !@#_$%^&*-()" }

  def update_slug
    self.slug = username
  end

  def to_param
    username
  end
end
