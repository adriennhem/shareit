class AddLongDescriptionToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :long_description, :text
    add_column :lectures, :teacher_description, :text
  end
end
