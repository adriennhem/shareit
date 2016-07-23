class RemoveFieldsToLectures < ActiveRecord::Migration
  def change
    remove_column :lectures, :learning_outcomes, :string
    remove_column :lectures, :long_description, :string
    remove_column :lectures, :background_image, :string
  end
end
