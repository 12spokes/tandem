class AddSlugAndIsDefaultToTandemPages < ActiveRecord::Migration
  def change
    add_column :tandem_pages, :slug, :string, :null => false
    add_column :tandem_pages, :is_default, :boolean, :null => false, :default => false
  end
end
