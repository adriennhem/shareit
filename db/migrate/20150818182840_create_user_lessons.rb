class CreateUserLessons < ActiveRecord::Migration
  def change
    create_table :user_lessons do |t|

      t.timestamps null: false
    end
  end
end
