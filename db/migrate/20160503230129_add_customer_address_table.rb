class AddCustomerAddressTable < ActiveRecord::Migration
  def change

    create_table :customers do |t|
      t.string :first_name, null: false
      t.string :last_name,  null: false
    end

    create_table :addresses do |t|
      t.references :customer, null: false
      t.string     :street,   null: false
      t.string     :city,     null: false
    end
    
  end
end
