class AddImgToTips < ActiveRecord::Migration[5.1]
  def change
    add_column :tips, :img, :string
  end
end
