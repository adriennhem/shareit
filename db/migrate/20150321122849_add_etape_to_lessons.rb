class AddEtapeToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :etape, :integer
  end
end
