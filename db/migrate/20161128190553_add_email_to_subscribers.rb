class AddEmailToSubscribers < ActiveRecord::Migration
  def change
  	add_column :subscribers, :email, :string
  	add_column :subscribers, :landing_page_id, :integer
  end
end
