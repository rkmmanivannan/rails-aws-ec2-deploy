class AddCustomerDetailsMaterializedView < ActiveRecord::Migration

  def up
    execute %{
      CREATE MATERIALIZED VIEW customer_details AS
        SELECT
          customers.id as customer_id,
          customers.first_name as first_name,
          customers.last_name as last_name,
          addresses.street as street,
          addresses.city as city
        FROM
          customers
        JOIN addresses ON
          customers.id = addresses.customer_id
    }

    execute %{
      CREATE UNIQUE INDEX
        customer_details_customer_id
      ON
        customer_details(customer_id)
    }
  end

  def down
    execute "DROP MATERIALIZED VIEW customer_details"
  end
end
