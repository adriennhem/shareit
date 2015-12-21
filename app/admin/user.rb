ActiveAdmin.register User do
  menu parent: "Users", label: "Users", priority: 1

  filter :enrollments

  index do
    column :email
    actions
  end


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :first_name, :last_name, :picture, :email, :role, :password, :password_confirmation, :biography
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "User", :multipart => true do
      f.input :role, as: :select, collection: User.roles.keys.to_a
      f.input :first_name
      f.input :last_name
      f.input :biography 
      f.input :facebook_url
      f.input :twitter_url
      f.input :linkedin_url 
      f.input :email
      f.input :password
      f.input :password_confirmation
      # f.input :role
      f.input :picture, :required => false, :as => :file
    end
    f.actions
  end

end
