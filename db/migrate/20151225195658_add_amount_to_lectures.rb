class AddAmountToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :amount, :integer
  end
end
