require 'bcrypt'

class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  validates :email, presence: true
  has_many :ingredients

  # def password=(raw)
  #   self.password_digest = BCrypt::Password.create(raw)
  # end

  # def is_password?(raw)
  #   BCrypt::Password.new(password_digest).is_password?(raw)
  # end
end