class AddAttributesTooLandingPages < ActiveRecord::Migration
  def change
  	 add_column :landing_pages, :short_description, :text
  	 add_column :landing_pages, :author_name, :string
  	 add_column :landing_pages, :video_link, :string
  end
end
