class Teacher < ActiveRecord::Base
  has_many :lectures
  has_attached_file :picture, :styles => { :medium => "150x150>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
end
