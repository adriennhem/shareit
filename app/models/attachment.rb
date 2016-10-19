class Attachment < ActiveRecord::Base
	after_create :update_uuid

	has_attached_file :document, 
		s3_permissions: :private
		
	validates_attachment :document, content_type: { content_type: "application/pdf" }
	
	belongs_to :project
	belongs_to :user

	validates :project_id, uniqueness: true

  	def update_uuid
      self.update_attributes(uuid: SecureRandom.uuid)
    end

end
