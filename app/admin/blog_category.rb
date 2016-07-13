ActiveAdmin.register BlogCategory do
  menu parent: "Blog", priority: 1

  


# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :permalink
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

filter :title

  form :html => { :enctype => "multipart/form-data", :class => 'expandable in' } do |f|
    f.inputs "Blog Categories", :multipart => true, :class => 'expandable in' do
      f.input :title
      f.input :permalink
    end
    f.actions
  end


end
