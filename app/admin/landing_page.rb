ActiveAdmin.register LandingPage do

menu label: "Custom Pages", priority: 4

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :permalink, :content, :title, :author_name, :video_link, :short_description
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

form do |f|
 f.inputs "Landing Page" do
	f.input :permalink
 	f.input :title
 	f.input :author_name
 	f.input :video_link
	f.input :short_description
 end
  f.actions
end

end
