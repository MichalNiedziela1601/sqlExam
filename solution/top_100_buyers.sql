-- Write your solution here
CREATE OR REPLACE FUNCTION update_top_100_trigger_function()
RETURNS trigger AS
$$
    BEGIN
       REFRESH MATERIALIZED VIEW top_100_buyers;
    RETURN NULL;
    END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER test_100_trigger
AFTER INSERT OR UPDATE OR DELETE
    ON customer
        FOR EACH ROW
            EXECUTE PROCEDURE update_top_100_trigger_function();


CREATE TRIGGER test_100_product_trigger
AFTER INSERT OR UPDATE OR DELETE
    ON product
        FOR EACH ROW
            EXECUTE PROCEDURE update_top_100_trigger_function();
