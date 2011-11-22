class CreateTandemContents < ActiveRecord::Migration
  def change
    create_table :tandem_contents do |t|
      t.integer :page_id
      t.string :type
      t.string :token
      t.string :tag
      t.text :content
      t.binary :bcontent

      t.timestamps
    end
  end
end
