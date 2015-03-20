class AddAdminIdToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :admin_id, :integer
    add_index :lectures, :admin_id
  end
end
