class AddCoreLessonToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :core_lesson, :boolean, default: false
  end
end
