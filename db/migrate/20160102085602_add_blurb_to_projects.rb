class AddBlurbToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :blurb, :text
    add_column :projects, :location, :string
  end
end
