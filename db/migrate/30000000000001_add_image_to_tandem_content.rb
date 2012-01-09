class AddImageToTandemContent < ActiveRecord::Migration
  def change
    add_column :tandem_contents, :image_id, :integer
  end
end
