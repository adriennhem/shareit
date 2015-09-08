class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :title
      t.string :author
      t.string :video
      t.string :body, :text

      t.timestamps null: false
    end
  end
end
