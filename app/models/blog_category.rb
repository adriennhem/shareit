class BlogCategory < ActiveRecord::Base
	# basic assossiations
	has_many :posts
	
	# validations 
	validates :title, presence: true 
end
