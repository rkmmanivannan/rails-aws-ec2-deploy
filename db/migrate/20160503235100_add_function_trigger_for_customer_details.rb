class AddFunctionTriggerForCustomerDetails < ActiveRecord::Migration
  def up
    execute %{
      CREATE OR REPLACE FUNCTION
        refresh_customer_details()
        RETURNS TRIGGER LANGUAGE PLPGSQL
      AS
      $$
      BEGIN
        REFRESH MATERIALIZED VIEW customer_details;
        RETURN NULL;
      EXCEPTION
        WHEN feature_not_supported THEN
        RETURN NULL;
      END
      $$;
    }

  %w(customers addresses).each do |table|
      execute %{
        CREATE TRIGGER
          refresh_customer_details
        AFTER
          INSERT OR
          DELETE OR
          UPDATE
        ON
          #{table}
        FOR EACH STATEMENT
          EXECUTE PROCEDURE refresh_customer_details()
      }
    end
  end

  def down
    %w(customers addresses).each do |table|
      execute %{
        DROP TRIGGER refresh_customer_details ON #{table}
      }
    end

    execute %{DROP FUNCTION refresh_customer_details()}
  end
end
