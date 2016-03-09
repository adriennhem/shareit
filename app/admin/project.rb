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
permit_params :approved
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitteds
# end


end
