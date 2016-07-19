class Chapter < ActiveRecord::Base
  has_many :lessons, dependent: :destroy
  belongs_to :lecture
  accepts_nested_attributes_for :lessons, allow_destroy: true
end
