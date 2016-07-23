ActiveAdmin.register Chapter do
  belongs_to :lecture
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :id, :title, :description, :number, :total_duration, lessons_attributes: [:id, :title, :description, :vid, :etape, :short_description, :video_duration, :preview_link]
  #
  # or
  #
  form :html => { :enctype => "multipart/form-data" } do |f|
  f.inputs "Chapter", :multipart => true do
      f.input :title
      f.input :description
      f.input :number
      f.input :total_duration
    end
      f.has_many :lessons, :class => 'inputs expandable out inputs-lesson' do |d| 
        d.input :etape
        d.input :title
        d.input :preview_link
        d.input :short_description, input_html: {rows: 2} 
        d.input :vid, input_html: {rows: 2} 
        d.input :video_duration
        d.input :description, :as => :ckeditor
        d.input :_destroy, :as => :boolean, :required => false, :label => 'Remove'
      end
  f.actions
end


end
