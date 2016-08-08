class AddApprovedDateToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :approved_date, :datetime
  end
end
