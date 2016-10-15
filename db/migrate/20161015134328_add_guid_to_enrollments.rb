class AddGuidToEnrollments < ActiveRecord::Migration
  def change
    add_column :enrollments, :uuid, :string
  end
end
