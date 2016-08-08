class ChangeDeadlinefromProjects < ActiveRecord::Migration
  def change
  	change_column :projects, :deadline, 'integer USING CAST(deadline AS integer)'
  end
end
