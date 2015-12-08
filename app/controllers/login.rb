get "/login" do

erb :"users/login"

end

post "/login" do
	
	 if user = User.authenticate(params[:user][:email],params[:user][:password])
		session[:user_id] = user.id
		redirect to "/"
	else
		@login_error = "Invalid Login"
		erb :"users/login"
	end
end