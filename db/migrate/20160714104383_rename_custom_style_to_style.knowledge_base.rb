# This migration comes from knowledge_base (originally 20140821085102)
class RenameCustomStyleToStyle < ActiveRecord::Migration
  def change
    rename_column :knowledge_base_sectionables_attachments_lists, :custom_style, :style
    rename_column :knowledge_base_sectionables_galleries,         :custom_style, :style
    rename_column :knowledge_base_sectionables_images,            :custom_style, :style
    rename_column :knowledge_base_sectionables_links_lists,       :custom_style, :style
    rename_column :knowledge_base_sectionables_lists,             :custom_style, :style
    rename_column :knowledge_base_sectionables_texts,             :custom_style, :style
    rename_column :knowledge_base_sectionables_videos,            :custom_style, :style
  end
end
