class AddUserIdToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :user_id, :integer
    add_column :attachments, :project_id, :integer
  end
end
