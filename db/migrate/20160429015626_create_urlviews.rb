class CreateUrlviews < ActiveRecord::Migration
  def change
    create_table :urlviews do |t|
      t.references :urlshort, index: true, foreign_key: true
      t.integer :count, default: 0

      t.timestamps null: false
    end
  end
end
