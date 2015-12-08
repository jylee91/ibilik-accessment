class Property < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	has_many :bookings

	validates :property_description, presence:true
	validates :rental, presence:true
end
