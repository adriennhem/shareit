class AddMainContactToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :main_contact, :string
  end
end
