class UpgradeInitialModels < ActiveRecord::Migration
  def change
    change_table :tandem_pages do |t|
      t.rename :token, :page_label
      t.rename :layout, :link_label

      t.index :parent_id
    end
    change_column :tandem_pages, :link_label, :string, :null => false

    change_table :tandem_contents do |t|
      t.remove :token, :bcontent
      t.text :details
      t.string :link_url
      t.string :link_target
      t.references :attachment, :polymorphic => {:default => 'Tandem::Image'}

      t.index :page_id
      t.index [:page_id,:type,:tag], :unique => true
    end
    change_column :tandem_contents, :page_id, :integer, :null => false
    change_column :tandem_contents, :type, :string, :null => false
    change_column :tandem_contents, :tag, :string, :null => false
  end
end
