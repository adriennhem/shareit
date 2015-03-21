class Category < ActiveRecord::Base
	has_many :lectures, dependent: :destroy 
end
