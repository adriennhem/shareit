class AddUserIdToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :user_id, :integer
    add_index :lectures, :user_id
  end
end
