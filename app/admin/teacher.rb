ActiveAdmin.register Teacher do
  menu parent: "Courses", priority: 3

  filter :name

  index do
    column :name
    actions
  end


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :biography,:picture
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  form :html => { :enctype => "multipart/form-data" } do |f|
  f.inputs "Teacher", :multipart => true do
    f.input :name
    f.input :biography
    f.input :picture, :required => false, :as => :file
  end
  f.actions
end

end
