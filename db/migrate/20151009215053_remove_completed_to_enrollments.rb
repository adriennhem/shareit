class RemoveCompletedToEnrollments < ActiveRecord::Migration
  def change
  	remove_column :enrollments, :complete
  end
end
