class AddMainContactEmailToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :main_contact_email, :string
  end
end
