class AddVideoToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :video, :text
  end
end
