class ChangeDeadlineDefaultfromProjects < ActiveRecord::Migration
  def change
  	change_column :projects, :deadline, :integer, :default => 45
  end
end
