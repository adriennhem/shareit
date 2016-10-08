class Post < ActiveRecord::Base
    extend FriendlyId
    friendly_id :permalink, use: :finders

    after_save :update_permalink, :new_post
    
	acts_as_taggable_on :tags
	# basic assossiations 
	belongs_to :blog_category
	belongs_to :user 
	has_one :seo, dependent: :destroy
	accepts_nested_attributes_for :seo, allow_destroy: true

	# paperclip 
	has_attached_file :picture, :styles => { :medium => "400x400>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
	# validations 
	validates :blog_category_id, presence: true 
	validates :permalink, uniqueness: true
	validates :user_id, presence: true
	validates :title, presence: true
	validates :content, presence: true

	scope :published, -> { where(published: true) }

	private 

	def update_permalink
		update_column(:permalink, title.rstrip.downcase.gsub(/\s/, "-")) 
	end 

	def new_post
		Pusher.trigger('blog_index', 'new_post', {
	      title: self.title,
	    })
	end
end
