class User < ApplicationRecord
	before_save { self.email = email.downcase }
   VALID_LAST_NAME_REGEX = /^[a-zA-Z0-9\-_]{0,40}$/
   validates :last_name, presence: true, length: { maximum: 50 }
   VALID_FIRST_NAME_REGEX = /^[a-zA-Z0-9\-_]{0,40}$/
   validates :first_name, presence: true, length: { maximum: 50 }
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, length: { maximum: 255 },
                           format: { with: VALID_EMAIL_REGEX },
                           uniqueness: { case_sensitive: false }
   has_secure_password
   validates :password, presence: true

 # Returns the hash digest of the given string.
 def User.digest(string)
   BCrypt::Password.create(string, cost: cost)
   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                 BCrypt::Engine.cost
 end
end
