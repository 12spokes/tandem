class CreateTandemImages < ActiveRecord::Migration
  def change
    create_table :tandem_images do |t|

      t.timestamps
    end
  end
end
