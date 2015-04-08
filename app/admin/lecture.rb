ActiveAdmin.register Lecture do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :description, :created_at, :updated_at, :category_id, :picture_file_name, :picture, :picture_content_type, :picture_file_size, :picture_updated_at, lessons_attributes: [:id, :title, :description, :vid, :etape]
                
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form :html => { :enctype => "multipart/form-data" } do |f|
  f.inputs "Lectures", :multipart => true do
    f.input :title
    f.input :description, :as => :ckeditor
    f.input :category_id
    f.input :picture, :required => false, :as => :file, :hint => f.template.image_tag(f.object.picture.url(:medium))
  end
  f.inputs "Lessons" do
      f.has_many :lessons do |d|
        d.input :title
        d.input :description, :as => :ckeditor
        d.input :vid
        d.input :etape
      end
    end
  f.actions
end

end
