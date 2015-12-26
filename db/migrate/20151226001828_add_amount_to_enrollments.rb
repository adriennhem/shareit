class AddAmountToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :amount, :integer
  end
end
