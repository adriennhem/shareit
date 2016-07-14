# This migration comes from knowledge_base (originally 20140306200631)
class CreateKnowledgeBaseSectionablesLists < ActiveRecord::Migration
  def change
    create_table :knowledge_base_sectionables_lists do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
