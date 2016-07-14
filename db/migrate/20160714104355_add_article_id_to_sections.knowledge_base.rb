# This migration comes from knowledge_base (originally 20140306134124)
class AddArticleIdToSections < ActiveRecord::Migration
  def change
    change_table :knowledge_base_sections do |t|
      t.references :article, index: true
    end
  end
end
