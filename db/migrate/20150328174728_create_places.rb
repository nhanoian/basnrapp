class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :title
      t.string :url
      t.text :description
      t.string :lat
      t.string :long
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
