class Attachment < ActiveRecord::Base
	has_attached_file :document
	validates_attachment :document, content_type: { content_type: "application/pdf" }
	
	belongs_to :project
	belongs_to :user

	validates :project_id, uniqueness: true
end
