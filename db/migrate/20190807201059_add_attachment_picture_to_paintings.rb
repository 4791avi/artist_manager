class AddAttachmentPictureToPaintings < ActiveRecord::Migration
  def self.up
    change_table :paintings do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :paintings, :picture
  end
end
