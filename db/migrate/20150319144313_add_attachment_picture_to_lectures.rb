class AddAttachmentPictureToLectures < ActiveRecord::Migration
  def self.up
    change_table :lectures do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :lectures, :picture
  end
end
