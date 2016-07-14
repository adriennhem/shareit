# This migration comes from knowledge_base (originally 20140306181906)
class CreateKnowledgeBaseSectionablesVideos < ActiveRecord::Migration
  def change
    create_table :knowledge_base_sectionables_videos do |t|
      t.string :url

      t.timestamps
    end
  end
end
