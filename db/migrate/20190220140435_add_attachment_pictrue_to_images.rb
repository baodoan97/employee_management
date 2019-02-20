class AddAttachmentPictrueToImages < ActiveRecord::Migration[5.2]
  def self.up
    change_table :images do |t|
      t.attachment :pictrue
    end
  end

  def self.down
    remove_attachment :images, :pictrue
  end
end
