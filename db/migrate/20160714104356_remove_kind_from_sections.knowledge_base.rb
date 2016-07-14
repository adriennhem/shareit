# This migration comes from knowledge_base (originally 20140306134616)
class RemoveKindFromSections < ActiveRecord::Migration
  def change
    remove_column :knowledge_base_sections, :kind, :string
  end
end
