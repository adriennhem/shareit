class Post < ActiveRecord::Base
	# basic assossiations 
	belongs_to :blog_category

	# validations 
	validates :blog_category_id, presence: true 
	validates :title, presence: true
	validates :content, presence: true
	validates :published, presence: true
end
