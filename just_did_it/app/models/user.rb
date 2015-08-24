class User < ActiveRecord::Base
  validates :first_name, :last_name,presence: true
  validates :handle, length: { minimum: 5 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password_digest, length: { in: 6..10 }

  def full_name
    first_name + " " + last_name
  end
end
