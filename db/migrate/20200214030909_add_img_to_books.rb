class AddImgToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :img, :text
  end
end
