class AddAttachmentImageToRobots < ActiveRecord::Migration
  def self.up
    change_table :robots do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :robots, :image
  end
end
