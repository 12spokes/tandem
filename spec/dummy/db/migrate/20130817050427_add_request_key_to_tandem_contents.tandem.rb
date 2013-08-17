# This migration comes from tandem (originally 30000000000001)
class AddRequestKeyToTandemContents < ActiveRecord::Migration
  def up
    add_column :tandem_contents, :request_key, :string
    
    Tandem::Content.all.each do |content|
      if Tandem::Page.exists?(content.page_id)
        page = Tandem::Page.find(content.page_id)
        content.update_attributes!(:request_key => "tandem-pages-#{page.slug}")
      end
    end

    remove_index :tandem_contents, :page_id
    remove_index :tandem_contents, [:page_id, :type, :tag]
    
    remove_column :tandem_contents, :page_id

    add_index :tandem_contents, :request_key
    add_index :tandem_contents, [:request_key, :type, :tag], :unique => true
  end

  def down
    add_column :tandem_contents, :page_id, :integer

    Tandem::Content.all.each do |content|
      if content.request_key =~ /^tandem-pages-.*$/
        page = Tandem::Page.find_by_slug(content.request_key.gsub(/^tandem-pages-/, ''))

        if page.present?
          content.update_attributes!(:page_id => page.id)
        else
          raise ActiveRecord::IrreversibleMigration
        end
      end
    end

    remove_index :tandem_contents, :request_key
    remove_index :tandem_contents, [:request_key, :type, :tag]
    
    remove_column :tandem_contents, :request_key

    add_index :tandem_contents, :page_id
    add_index :tandem_contents, [:page_id, :type, :tag], :unique => true
  end
end
