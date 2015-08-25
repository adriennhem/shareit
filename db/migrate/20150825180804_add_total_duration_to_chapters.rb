class AddTotalDurationToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :total_duration, :string
  end
end
