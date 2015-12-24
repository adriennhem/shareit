class AddPostIdToSeos < ActiveRecord::Migration
  def change
    add_column :seos, :post_id, :integer
  end
end
