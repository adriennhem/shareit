class AddBooleanToUserLessons < ActiveRecord::Migration
  def change
  	change_column :user_lessons, :completed, :boolean, :default => false
  end
end
