class AddAttachmentResourceToImage < ActiveRecord::Migration
  def self.up
    add_column :tandem_images, :resource_file_name, :string
    add_column :tandem_images, :resource_content_type, :string
    add_column :tandem_images, :resource_file_size, :integer
    add_column :tandem_images, :resource_updated_at, :datetime
  end

  def self.down
    remove_column :tandem_images, :resource_file_name
    remove_column :tandem_images, :resource_content_type
    remove_column :tandem_images, :resource_file_size
    remove_column :tandem_images, :resource_updated_at
  end
end
