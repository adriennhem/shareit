class AddBooleannToUserLessons < ActiveRecord::Migration
  def change
  	  	change_column :user_lessons, :completed, :boolean, :default => true
  end
end
