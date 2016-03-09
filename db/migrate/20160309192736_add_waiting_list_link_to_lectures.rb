class AddWaitingListLinkToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :waiting_list, :string
  end
end
