class RemoveInstitutionFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :institution
  end
end
