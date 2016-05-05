class CreateUrlshorts < ActiveRecord::Migration
  def change
    create_table :urlshorts do |t|
      t.string :originalurl
      t.string :encryptedurl
      t.inet :ipaddress
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
