ActiveAdmin.register User do
  menu parent: "Users", label: "Users", priority: 1

  filter :enrollments
  filter :role

  index do
    column :email
    actions
  end

  show do |user|
    attributes_table do
      #We want to keep the existing columns
      User.column_names.each do |column|
        row column
      end
      #This is where we add a new column
      row :login_as do
        link_to "#{user.email}", login_as_admin_user_path(user), :target => '_blank'
      end
      row :picture do 
        image_tag(user.picture.url(:thumb), :height => '100')
      end
    end
  end

  # Allows admins to login as a user 
  member_action :login_as, :method => :get do
    user = User.find(params[:id])
    sign_in(user, bypass: true)
    redirect_to profile_path 
  end

  # For not updating the password all the time
  controller do

    def update
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end

  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :admin, :first_name, :last_name, :picture, :email, :role, :password, :password_confirmation, :biography, :twitter_url, :linkedin_url, :google_plus, enrollments_attributes: [:user_id, :lecture_id, :amount]
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
      f.input :admin
      f.input :role, as: :select, collection: User.roles.keys.to_a
      f.input :first_name
      f.input :last_name
      f.input :biography, as: :ckeditor 
      f.input :twitter_url
      f.input :linkedin_url 
      f.input :google_plus 
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :picture, :as => :file, :hint => f.image_tag(f.user.picture.url(:medium)) 
    end
    f.actions
  end

end
