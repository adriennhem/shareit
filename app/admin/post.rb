ActiveAdmin.register Post do
  menu parent: "Blog", priority: 1


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :content
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  form :html => { :enctype => "multipart/form-data" } do |f|
  f.inputs "Blog Posts", :multipart => true do
    f.input :title
    f.input :content
  end
  f.actions
end

end
