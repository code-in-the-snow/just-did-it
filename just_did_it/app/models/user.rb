class User < ActiveRecord::Base
  validates :first_name, :last_name,presence: true
  validates :handle, length: { minimum: 5 }

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
                    # uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def full_name
    first_name + " " + last_name
  end
end
