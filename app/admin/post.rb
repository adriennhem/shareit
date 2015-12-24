ActiveAdmin.register Post do
  menu parent: "Blog", priority: 2

  index do
    column :published, sortable: true
    column :title, sortable: true
    column :blog_category, sortable: true
    column :permalink, sortable: true
    actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :content, :blog_category_id, :user_id, :published, :tag_list, :permalink, :picture, :summary, seos_attributes: [:title, :description, :keywords]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  show do |post|
    panel "Post" do
    attributes_table do
      #We want to keep the existing columns
      Post.column_names.each do |column|
        row column
      end
    end
  end
      panel "SEO" do
      table_for post.seo do
        column :title
        column :description
        column :keywords
      end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
  f.inputs "Blog Posts", :multipart => true do
    f.input :published
    f.input :blog_category_id, label: 'Blog Category', as: :select, collection: BlogCategory.all.map {|u| [u.title, u.id]}
    f.input :tag_list 
    f.input :user_id, label: 'Author', as: :select, collection: User.where(role: 3).map {|u| [u.email, u.id]}.to_a
    f.input :title
    f.input :permalink
    f.input :picture, :required => false, :as => :file
    f.input :summary
    f.input :content, :as => :ckeditor

  f.inputs "SEO", :for => [:seo, f.object.seo || Seo.new] do |s|
      s.input :title
      s.input :description
      s.input :keywords
    end
  end
  f.actions
end

end
