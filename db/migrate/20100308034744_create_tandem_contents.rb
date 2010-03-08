class CreateTandemContents < ActiveRecord::Migration
  def self.up
    create_table :tandem_contents do |t|
      t.integer :tandem_page_id
      t.string :resource_type
      t.integer :resource_id
      t.string :token

      t.timestamps
    end
  end

  def self.down
    drop_table :tandem_contents
  end
end
