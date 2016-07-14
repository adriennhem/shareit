ActiveAdmin.register Lesson do
  permit_params :title, :descriptions, :vid, :etape, :short_description, :video_duration, :preview_link
  
  belongs_to :chapter


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  form :html => { :enctype => "multipart/form-data" } do |f|
  f.inputs "Lesson", :multipart => true do
        f.input :etape
        f.input :title
        f.input :short_description
        f.input :preview_link
        f.input :vid
        f.input :video_duration
        f.input :description, :as => :ckeditor
  end

  f.actions
end


end
