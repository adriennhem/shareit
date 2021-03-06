ActiveAdmin.register Post do
  menu parent: "Blog", priority: 2

  after_create do |post|
    require 'slack-notifier'
    notifier = Slack::Notifier.new "https://hooks.slack.com/services/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", channel: '#workshopr-general',
                                          username: 'Blog Notifier'
    notifier.ping "#{current_user.name} has published a new blog post ! Go check on the [Blog](http://www.workshopr.me/blog) !"
  end

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
  permit_params :title, :content, :blog_category_id, :user_id, :published, :tag_list, :permalink, :picture, :summary, seo_attributes: [:id, :title, :description, :keywords, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
filter :tags 
filter :blog_category
filter :title
filter :user
filter :content
filter :published, as: :radio


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

  f.inputs "SEO" do
    f.has_many :seo, allow_destroy: true do |s|
      s.input :title
      s.input :description
      s.input :keywords
    end
  end
  end
  f.actions
end

end
