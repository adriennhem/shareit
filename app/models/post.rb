class Post < ActiveRecord::Base
    extend FriendlyId
    friendly_id :permalink, use: :finders
    
	acts_as_taggable_on :tags
	# basic assossiations 
	belongs_to :blog_category
	belongs_to :user 

	# validations 
	validates :blog_category_id, presence: true 
	validates :user_id, presence: true
	validates :title, presence: true
	validates :content, presence: true
end
