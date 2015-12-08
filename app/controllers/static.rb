get '/' do

	@properties = Property.all
	@signup_succ = params[:signup_succ]
	@comments = Comment.all
	@bookings = Booking.all

  erb :"static/index"
end