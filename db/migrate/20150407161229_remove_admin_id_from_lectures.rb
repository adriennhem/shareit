class RemoveAdminIdFromLectures < ActiveRecord::Migration
  def change
    remove_column :lectures, :admin_id, :integer
  end
end
