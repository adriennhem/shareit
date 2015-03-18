class Category < ActiveRecord::Base
	has_many :lectures
end
