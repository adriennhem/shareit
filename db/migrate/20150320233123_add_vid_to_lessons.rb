class AddVidToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :vid, :text
  end
end
