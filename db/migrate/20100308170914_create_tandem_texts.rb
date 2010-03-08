class CreateTandemTexts < ActiveRecord::Migration
  def self.up
    create_table :tandem_texts do |t|
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :tandem_texts
  end
end
