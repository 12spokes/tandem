class CreateTandemPages < ActiveRecord::Migration
  def change
    create_table :tandem_pages do |t|
      t.integer :parent_id
      t.string :title
      t.string :token
      t.string :layout
      t.string :template
      t.string :keywords
      t.string :description

      t.timestamps
    end
  end
end
