ActiveAdmin.register Post do
  menu parent: "Blog", priority: 2


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :content, :blog_category_id, :user_id
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
    f.input :published
    f.input :blog_category_id, label: 'Blog Category', as: :select, collection: BlogCategory.all.map {|u| [u.title, u.id]} 
    f.input :user_id, label: 'Author', as: :select, collection: User.where(role: 3).map {|u| [u.email, u.id]}.to_a
    f.input :title
    f.input :content
  end
  f.actions
end

end
