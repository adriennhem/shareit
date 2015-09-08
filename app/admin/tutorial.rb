ActiveAdmin.register Tutorial do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :author, :video, :body

  form :html => { :enctype => "multipart/form-data" } do |f|
  f.inputs "Tutorials", :multipart => true do
    f.input :title
    f.input :author
    f.input :video 
    f.input :body, :as => :ckeditor
  end
  f.actions
end
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
