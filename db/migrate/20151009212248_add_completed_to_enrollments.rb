class AddCompletedToEnrollments < ActiveRecord::Migration
  def change
  	change_column :enrollments, :complete, :boolean, :default => false
  end
end
