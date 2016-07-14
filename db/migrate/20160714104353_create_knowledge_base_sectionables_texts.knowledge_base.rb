# This migration comes from knowledge_base (originally 20140306103853)
class CreateKnowledgeBaseSectionablesTexts < ActiveRecord::Migration
  def change
    create_table :knowledge_base_sectionables_texts do |t|
      t.string :heading
      t.text :lead
      t.text :body

      t.timestamps
    end
  end
end
