-- Write your solution here


CREATE OR REPLACE FUNCTION update_daily_trigger_function()
RETURNS trigger AS
$$
    BEGIN
       REFRESH MATERIALIZED VIEW daily_sum_of_orders;
    RETURN NULL;
    END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER update_daily_trigger
AFTER INSERT OR UPDATE OR DELETE
    ON orders
        FOR EACH STATEMENT
            EXECUTE PROCEDURE update_daily_trigger_function();
