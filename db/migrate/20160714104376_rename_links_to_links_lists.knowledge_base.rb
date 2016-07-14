# This migration comes from knowledge_base (originally 20140410224403)
class RenameLinksToLinksLists < ActiveRecord::Migration
  def change
    rename_table :knowledge_base_sectionables_links, :knowledge_base_sectionables_links_lists
  end
end
