class AddPortraitToBands < ActiveRecord::Migration
  def change
    add_column :bands, :portrait, :string
  end
end
