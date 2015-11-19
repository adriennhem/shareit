ActiveAdmin.register Lecture do
  menu label: "Lectures", parent: "Products", priority: 2
  filter :category

  index do
    column :title, sortable: true
    actions
  end

  show sortable: :number do
    panel "Lecture Curriculum" do
      lecture.chapters.each do |chapter|
        panel chapter.title, sortable: true do
            h3 chapter.title
            h5 link_to "Edit", "/admin/lectures/#{lecture.id}/chapters/#{chapter.id}/edit"
            chapter.lessons.each do |lesson|
              panel lesson.title, sortable: true do
              h4 lesson.title
               h5 link_to "Edit", "/admin/chapters/#{chapter.id}/lessons/#{lesson.id}/edit"
             end
            end
          end
 
      end
    end
  end

  
 
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :title, :description, :created_at, :updated_at, :category_id, :name, :picture_file_name, :teacher_id, :video,
  :picture, :picture_content_type, :picture_file_size, :picture_updated_at, :learning_outcomes, 
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
    f.input :learning_outcomes, as: :ckeditor
    f.input :picture, :required => false, :as => :file
  end
  f.inputs "Chapters" do
    f.has_many :chapters, sortable: :number do |c|
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
