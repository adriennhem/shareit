class AddLearningOutcomesToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :learning_outcomes, :text
  end
end
