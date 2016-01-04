class AddPublishedToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :published, :boolean, default: false
  end
end
