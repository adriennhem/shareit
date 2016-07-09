class AddAttributesToLandingPages < ActiveRecord::Migration
  def change
  	add_column :landing_pages, :permalink, :string
  	add_column :landing_pages, :content, :text
  end
end
