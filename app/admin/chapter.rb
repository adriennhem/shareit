ActiveAdmin.register Chapter do

  belongs_to :lecture
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :id, :title, :description, :number, :total_duration, lessons_attributes: [:id, :title, :description, :vid, :etape, :short_description, :video_duration]
  #
  # or
  #
  form :html => { :enctype => "multipart/form-data" } do |f|
  f.inputs "Chapter", :multipart => true do
      f.input :title
      f.input :description
      f.input :number
      f.input :total_duration
    end
  f.actions
end


end
