class RemoveCouponFromEnrollments < ActiveRecord::Migration
  def change
  	remove_column :enrollments, :coupon, :string
  end
end
