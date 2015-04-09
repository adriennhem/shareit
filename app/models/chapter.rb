class Chapter < ActiveRecord::Base
	has_many :lessons
	belongs_to :lecture

	accepts_nested_attributes_for :lessons
end
