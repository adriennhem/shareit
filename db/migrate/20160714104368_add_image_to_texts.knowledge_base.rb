# This migration comes from knowledge_base (originally 20140320125825)
class AddImageToTexts < ActiveRecord::Migration
  def change
    add_column :knowledge_base_sectionables_texts, :image, :string
  end
end
