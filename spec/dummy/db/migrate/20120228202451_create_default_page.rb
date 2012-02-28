#NOTE:: The timestamp for the this file is set way into the future so that it is always the last migration run
class CreateDefaultPage < ActiveRecord::Migration
  def up
    Tandem::Page.new(link_label: 'Sample Page', slug: 'sample').save!
  end

  def down
    Tandem::Page.delete_all
  end
end
