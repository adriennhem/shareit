# This migration comes from knowledge_base (originally 20140410184906)
class CreateKnowledgeBaseSectionablesAttachmentLists < ActiveRecord::Migration
  def change
    create_table :knowledge_base_sectionables_attachment_lists do |t|
      t.timestamps
    end
  end
end
