class CreateOutlines < ActiveRecord::Migration
  def change
    create_table :outlines do |t|

      t.timestamps null: false
    end
  end
end
