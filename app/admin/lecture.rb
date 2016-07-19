ActiveAdmin.register Lecture do
  menu label: "Courses", parent: "Courses", priority: 2
  filter :category
  filter :teacher 

  index do
    column :published, sortable: true
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
  permit_params :learn_description, :practice_description, :hired_description, :amount, :title, :description, :created_at, :updated_at, :category_id, :name, :picture_file_name, :teacher_id, :video, :permalink, :published,
  :picture, :waiting_list, :picture_content_type, :picture_file_size, :picture_updated_at, :learning_outcomes, :long_description, :teacher_description, :background_image,
  chapters_attributes: [:id, :title, :description, :number, :total_duration, :_destroy, lessons_attributes: [:id, :title, :description, :vid, :etape, :short_description, :video_duration, :preview_link, :_destroy]]

  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form :html => { :enctype => "multipart/form-data", class: 'form-lecture'} do |f|
  panel "Main Lecture Settings", class: "lecture-main-settings" do 
  button "Main Lecture Settings", class: 'btn-toggle', type: 'button'    
  f.inputs "Lectures", :multipart => true, :class => 'lecture-inputs' do
    f.input :published 
    f.input :waiting_list
    f.input :category_id
    f.input :teacher_id, label: 'Teacher', as: :select, collection: Teacher.all.map {|t| [t.name, t.id]}
    f.input :amount
    f.input :title
    f.input :permalink
    f.input :video, input_html: {rows: 1} 
    f.input :background_image
    f.input :teacher_description, as: :ckeditor
    f.input :description, input_html: {rows: 2}
    f.input :learn_description, as: :ckeditor
    f.input :practice_description, as: :ckeditor 
    f.input :hired_description, as: :ckeditor  
    f.input :long_description, as: :ckeditor
    f.input :learning_outcomes, as: :ckeditor
    f.input :picture, :as => :file, :hint => f.image_tag(f.lecture.picture.url(:medium)) 
  end
  end
  
  f.inputs "Chapters", :class => "inputs aa-box-chapters" do
    f.has_many :chapters, sortable: :number, :class => "inputs expandable in" do |c|
      c.input :title
      c.input :description, input_html: {rows: 2} 
      c.input :number
      c.input :total_duration
      c.input :_destroy, :as => :boolean, :required => false, :label => 'Remove'
      c.has_many :lessons, :class => 'inputs expandable out inputs-lesson' do |d|   
        d.input :etape
        d.input :title
        d.input :preview_link
        d.input :short_description, input_html: {rows: 2} 
        d.input :vid, input_html: {rows: 2} 
        d.input :video_duration
        d.input :description, :as => :ckeditor
        d.input :_destroy, :as => :boolean, :required => false, :label => 'Remove'
      end
    end
    end

  f.actions
end

end
