# Create new Comment Form

get "/properties/:id/comments/new" do
	@property = Property.find_by(id: params[:id])
	erb :"comments/new_comment"
end

# Create New Comment

post "/properties/:id/comments" do
	@property = Property.find_by(id: params[:id])
	@comment = @property.comments.new(comment_detail: params[:comment][:comment_detail], user_id: current_user.id)


	if @comment.save
		redirect to "/properties/#{@property.id}"
	else
		erb :"comments/new_comment"
	end
end

# Show Comment

get "/comments/:id" do
	@comments = Comment.find_by(id: params[:id])
	
	erb :"comments/show_comment"
end

# Edit Comment

get "/comments/:id/edit" do

	@comment = Comment.find_by(id: params[:id])
	erb :"comments/edit_comment"
end

# Update Comment

put "/comments/:id/update" do
	
	@comment = Comment.find_by(id: params[:id])
	@comment.comment_detail = params[:comment][:comment_detail]
	if @comment.save
		redirect to "/properties/#{@comment.property.id}"
	else
		erb :"comments/edit_comment"
	end
end

# Delete Comment

delete "/comments/:id" do
	@comment = Comment.find_by(id: params[:id])
	@comment.destroy
	redirect to "/properties/#{@comment.property.id}"
end

