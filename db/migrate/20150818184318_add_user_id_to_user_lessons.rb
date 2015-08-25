class AddUserIdToUserLessons < ActiveRecord::Migration
  def change
    add_column :user_lessons, :user_id, :integer
    add_column :user_lessons, :lesson_id, :integer
    add_column :user_lessons, :completed, :boolean, :default => true 
  end
end
