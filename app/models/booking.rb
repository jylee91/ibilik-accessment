class Booking < ActiveRecord::Base
	belongs_to :property
	belongs_to :user

	validates :booking_date, presence:true
end
