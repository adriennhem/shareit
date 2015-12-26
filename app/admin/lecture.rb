ActiveAdmin.register Lecture do
  menu label: "Lectures", parent: "Products", priority: 2
  filter :category

  index do
    column :title, sortable: true
    column :category, sortable: true
    column :teacher, sortable: true
    actions
  end

  show sortable: :number do

    attributes_table do
     row :picture do 
        image_tag(lecture.picture.url(:thumb), :height => '100')
      end
    end
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
  permit_params :amount, :title, :description, :created_at, :updated_at, :category_id, :name, :picture_file_name, :teacher_id, :video, :permalink, 
  :picture, :picture_content_type, :picture_file_size, :picture_updated_at, :learning_outcomes, :long_description, :teacher_description, :background_image,
  chapters_attributes: [:id, :title, :description, :number, :total_duration, lessons_attributes: [:id, :title, :description, :vid, :etape, :short_description, :video_duration]]

  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form :html => { :enctype => "multipart/form-data", :class => 'expandable in' } do |f|
  f.inputs "Lectures", :multipart => true, :class => 'expandable in' do
    f.input :category_id
    f.input :teacher_id, label: 'Teacher', as: :select, collection: Teacher.all.map {|t| [t.name, t.id]}
    f.input :teacher_id
    f.input :amount
    f.input :title
    f.input :permalink
    f.input :video 
    f.input :background_image
    f.input :teacher_description, as: :ckeditor
    f.input :description
    f.input :long_description, as: :ckeditor
    f.input :learning_outcomes, as: :ckeditor
    f.input :picture, :as => :file, :hint => f.image_tag(f.lecture.picture.url(:medium)) 
  end
  f.inputs "Chapters", :class => 'inputs expandable in' do
    f.has_many :chapters, sortable: :number do |c|
      c.input :title
      c.input :description
      c.input :number
      c.input :total_duration
      c.has_many :lessons, :class => 'inputs expandable in' do |d|
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
