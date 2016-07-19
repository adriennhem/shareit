class Chapter < ActiveRecord::Base
  has_many :lessons
  belongs_to :lecture, dependent: :destroy
  accepts_nested_attributes_for :lessons, allow_destroy: true
end
