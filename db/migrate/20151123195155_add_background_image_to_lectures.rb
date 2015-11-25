class AddBackgroundImageToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :background_image, :string
  end
end
