require 'bcrypt'

class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :username, uniqueness: true
  validates :username, presence: true
  # create bi-directional associations
  # https://guides.rubyonrails.org/association_basics.html#bi-directional-associations
  has_many :events

  # see: https://github.com/bcrypt-ruby/bcrypt-ruby
  def password=(raw)
    # # temporary variable, not in db
    # @password = raw
    self.password = BCrypt::Password.create(raw)
  end

  def is_password?(raw)
    BCrypt::Password.new(password_digest).is_password?(raw)
  end
end