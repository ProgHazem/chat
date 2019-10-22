class User < ApplicationRecord
  has_many :messages
  validates :username, presence:true, uniqueness: {
      case_sensitive: false
  } , length: {minimum: 5, maximum: 40}
  has_secure_password
end
