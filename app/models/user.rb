class User < ActiveRecord::Base
    has_secure_password

validates :password, :password_confirmation, length: {minimum: 5}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

end
