ActiveAdmin.register User do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :first_name, :last_name, :picture, :email
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "User", :multipart => true do
    f.input :first_name
    f.input :last_name
    f.input :email
    f.input :picture, :required => false, :as => :file
  end
  f.actions
end

end
