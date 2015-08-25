ActiveAdmin.register Chapter do

  belongs_to :lecture
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :id, :title, :description, :number, :total_duration, lessons_attributes: [:id, :title, :description, :vid, :etape, :short_description, :video_duration]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
