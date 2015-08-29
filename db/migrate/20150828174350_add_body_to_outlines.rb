class AddBodyToOutlines < ActiveRecord::Migration
  def change
    add_column :outlines, :body, :text
  end
end
