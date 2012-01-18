class AddSlugAndIsDefaultToTandemPages < ActiveRecord::Migration
  def change
    add_column :tandem_pages, :slug, :string
    add_column :tandem_pages, :is_default, :boolean, :null => false, :default => false

    Tandem::Page.reset_column_information
    Tandem::Page.all.each_with_index do |page,i|
      page.slug = "#{slug}_#{i}"
      page.save!
    end

    change_column :tandem_pages, :slug, :string, :null => false
  end
end
