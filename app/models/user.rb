class User < ActiveRecord::Base
	has_many :properties
	has_many :comments
	has_many :bookings

	validates :password, presence:true
	validates :email, presence:true, uniqueness: true,
    format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\W]+\z/ }

	def self.authenticate(email,password)
		user = User.find_by(email: email)
		if user && user.password == password
			return user
		else
			nil
		end
	end
end