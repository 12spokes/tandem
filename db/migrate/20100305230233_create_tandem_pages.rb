class CreateTandemPages < ActiveRecord::Migration
  def self.up
    create_table :tandem_pages do |t|
      t.string :title
      t.string :token
      t.string :layout
      t.string :template
      t.integer :parent_id
      t.string :keywords
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :tandem_pages
  end
end
