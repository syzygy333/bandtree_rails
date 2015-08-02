class AddBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false
      t.string :record_label
      t.integer :year_formed
      t.integer :year_disbanded
      t.integer :reunion_start
      t.integer :reunion_end
      t.string :official_link
      t.string :wiki_link
      t.text :biography
      t.boolean :private?, default: false
    end
  end
end
