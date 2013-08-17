# This migration comes from tandem (originally 20111122221549)
class CreateTandemPages < ActiveRecord::Migration
  def change
    create_table :tandem_pages do |t|
      t.integer :parent_id
      t.string :title
      t.string :page_label
      t.string :link_label, :null => false
      t.string :layout
      t.string :template
      t.string :keywords
      t.string :description
      t.string :slug, :null => false
      t.boolean :is_default, :default => false, :null => false

      t.timestamps
    end

    add_index :tandem_pages, :parent_id
  end
end
