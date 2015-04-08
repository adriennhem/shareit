class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.text :biography

      t.timestamps null: false
    end
  end
end
