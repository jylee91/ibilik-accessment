class Comment < ActiveRecord::Base
	belongs_to :property
	belongs_to :user

	validates :comment_detail, presence:true
end
