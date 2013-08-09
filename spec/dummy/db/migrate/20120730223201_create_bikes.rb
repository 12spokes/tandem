class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.integer :seats
      t.string :color

      t.timestamps
    end
  end
end
