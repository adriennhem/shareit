class AddMoreDescriptionsToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :learn_description, :text
    add_column :lectures, :practice_description, :text
    add_column :lectures, :hired_description, :text
  end
end
