ActiveAdmin.register Lecture do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :title, :description, :created_at, :updated_at, :category_id, :name, :picture_file_name, :teacher_id, :video,
  :picture, :picture_content_type, :picture_file_size, :picture_updated_at, 
  chapters_attributes: [:id, :title, :description, :number, :total_duration, lessons_attributes: [:id, :title, :description, :vid, :etape, :short_description, :video_duration]]

  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form :html => { :enctype => "multipart/form-data" } do |f|
  f.inputs "Lectures", :multipart => true do
    f.input :category_id
    f.input :teacher_id
    f.input :title
    f.input :video 
    f.input :description
    f.input :picture, :required => false, :as => :file
  end
  f.inputs "Chapters" do
    f.has_many :chapters do |c|
      c.input :title
      c.input :description
      c.input :number
      c.input :total_duration
      c.has_many :lessons do |d|
        d.input :etape
        d.input :title
        d.input :short_description
        d.input :vid
        d.input :video_duration
        d.input :description, :as => :ckeditor
      end
    end
  end

  f.actions
end

end
