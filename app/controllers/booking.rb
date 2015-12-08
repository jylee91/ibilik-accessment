# Display New Booking form

get "/properties/:id/bookings/new" do
	@property = Property.find_by(id: params[:id])
	erb :"bookings/new_booking"
end

# Display Bookings

post "/properties/:id/bookings" do
	@property = Property.find_by(id: params[:id])
	@booking = @property.bookings.new(booking_date: params[:booking][:booking_date], booking_detail: params[:booking][:booking_detail], user_id: current_user.id)


	if @booking.save
		redirect to "/properties/#{@property.id}"
	else
		erb :"bookings/new_booking"
	end
end

# Find Bookings

get "/bookings/:id" do
	@booking = Booking.find_by(id: params[:id])
	
	erb :"bookings/show_booking"
end

# Edit Bookings 

get "/bookings/:id/edit" do

	@booking = Booking.find_by(id: params[:id])
	erb :"bookings/edit_booking"
end

# Update Bookings 

put "/bookings/:id/update" do
	
	@booking = Booking.find_by(id: params[:id])
	@booking.booking_date = params[:booking][:booking_date]
	@booking.booking_detail = params[:booking][:booking_detail]

	if @booking.save
		redirect to "/properties/#{@booking.property.id}"
	else
		erb :"bookings/edit_booking"
	end

end

# Delete Bookings 

delete "/bookings/:id" do
	@booking = Booking.find_by(id: params[:id])
	@booking.destroy
	redirect to "/properties/#{@booking.property.id}"
end

