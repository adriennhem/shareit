class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :company_name
      t.string :phone_number
      t.text :body
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
