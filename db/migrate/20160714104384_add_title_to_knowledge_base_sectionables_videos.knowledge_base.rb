# This migration comes from knowledge_base (originally 20140821151832)
class AddTitleToKnowledgeBaseSectionablesVideos < ActiveRecord::Migration
  def change
    add_column :knowledge_base_sectionables_videos, :title, :string
  end
end
