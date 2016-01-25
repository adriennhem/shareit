class AddCompletedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :completed, :boolean, default: false
  end
end
