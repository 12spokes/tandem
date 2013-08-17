# This migration comes from tandem (originally 20111215001943)
class CreateTandemImages < ActiveRecord::Migration
  def change
    create_table :tandem_images do |t|
      t.string :resource_file_name
      t.string :resource_content_type
      t.integer :resource_file_size
      t.datetime :resource_updated_at

      t.timestamps
    end
  end
end
