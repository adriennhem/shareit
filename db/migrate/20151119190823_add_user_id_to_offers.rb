class AddUserIdToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :user_id, :integer
    add_column :offers, :project_id, :integer
  end
end
