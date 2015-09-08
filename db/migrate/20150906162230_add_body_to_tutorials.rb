class AddBodyToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :body, :text
  end
end
