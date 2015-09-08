class RemoveTextFromTutorials < ActiveRecord::Migration
  def change
    remove_column :tutorials, :text, :string
    remove_column :tutorials, :body, :string
  end
end
