class AddUuidToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :uuid, :string
  end
end
