class AddCompleteToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :complete, :boolean
  end
end
