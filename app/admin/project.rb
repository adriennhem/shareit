ActiveAdmin.register Project do
	menu parent: "Courses", priority: 4

index do
 column :approved, sortable: true
 column :title, sortable: true
 column :user_id, sortable: true
 column :industry, sortable: true
 column :completed, sortable: true
 actions
end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :approved, :lecture_id, :completed, :company_name, :phone_number, :body, :user_id, :title, :lecture_id, :blurb, :location, :industry, :company_description, :project_context, :deadline, :goal, :main_contact, :main_contact_email
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitteds
# end


end
