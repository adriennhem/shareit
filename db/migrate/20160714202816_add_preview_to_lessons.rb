class AddPreviewToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :preview_link, :string
  end
end
