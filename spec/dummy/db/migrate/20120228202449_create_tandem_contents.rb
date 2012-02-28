class CreateTandemContents < ActiveRecord::Migration
  def change
    create_table :tandem_contents do |t|
      t.integer :page_id, :null => false
      t.string :type, :null => false
      t.string :tag, :null => false
      t.text :content
      t.text :details
      t.string :link_url
      t.string :link_target
      t.integer :attachment_id
      t.string :attachment_type, :default => "Tandem::Image"
      t.integer :image_id

      t.timestamps
    end

    add_index :tandem_contents, :page_id
    add_index :tandem_contents, [:page_id, :type, :tag], :unique => true
  end
end
