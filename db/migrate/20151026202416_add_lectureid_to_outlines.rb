class AddLectureidToOutlines < ActiveRecord::Migration
  def change
    add_column :outlines, :lecture_id, :integer
  end
end

