class User < ActiveRecord::Base
	has_many :posts
	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end
