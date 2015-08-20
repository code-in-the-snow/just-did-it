class User < ActiveRecord::Base
  validates :first_name, :last_name,presence: true
  validates :handle, length: { minimum: 5 }
  validates :password_digest, length { in: 6..10 }
end
