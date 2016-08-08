class ChangeDeadlineDefaultfromProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :deadline, :integer, :default => 45
  end
end
