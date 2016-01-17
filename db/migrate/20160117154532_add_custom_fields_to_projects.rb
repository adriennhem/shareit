class AddCustomFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :industry, :string
    add_column :projects, :company_description, :text
    add_column :projects, :project_context, :text
    add_column :projects, :estimated_duration, :time
    add_column :projects, :deadline, :datetime
    add_column :projects, :goal, :text
  end
end
