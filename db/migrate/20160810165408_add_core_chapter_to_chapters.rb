class AddCoreChapterToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :core_chapter, :boolean, default: false
  end
end
