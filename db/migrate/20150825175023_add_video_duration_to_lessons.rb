class AddVideoDurationToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :short_description, :string
    add_column :lessons, :video_duration, :string
  end
end
