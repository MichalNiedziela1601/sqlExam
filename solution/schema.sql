DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;


CREATE SEQUENCE product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE product (
  id          BIGINT DEFAULT nextval('product_id_seq' :: REGCLASS) NOT NULL,
  name        CHARACTER VARYING(256)                               NOT NULL,
  category_id BIGINT                                               NOT NULL
);


CREATE TABLE category (
  id                 BIGINT DEFAULT nextval('category_id_seq' :: REGCLASS) NOT NULL,
  name               TEXT                                NOT NULL,
  parent_category_id BIGINT
);


ALTER TABLE ONLY product
ADD CONSTRAINT product_pk PRIMARY KEY (id);


ALTER TABLE ONLY category
ADD CONSTRAINT category_pk PRIMARY KEY (id);


ALTER TABLE ONLY category
ADD CONSTRAINT fk___category___parent_category FOREIGN KEY (parent_category_id) REFERENCES category (id) ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE ONLY product
ADD CONSTRAINT fk___product___category FOREIGN KEY (category_id) REFERENCES category (id) ON UPDATE CASCADE ON DELETE CASCADE;


--CREATE EXTENSION ltree;
--
--CREATE TABLE section (
--    id INTEGER PRIMARY KEY,
--    name TEXT,
--    parent_id INTEGER REFERENCES section,
--    parent_path LTREE
--);
--
--CREATE INDEX section_parent_path_idx ON section USING GIST (parent_path);
--CREATE INDEX section_parent_id_idx ON section (parent_id);
--
--CREATE OR REPLACE FUNCTION update_section_parent_path() RETURNS TRIGGER AS $$
--    DECLARE
--        path ltree;
--    BEGIN
--        IF NEW.parent_id IS NULL THEN
--            NEW.parent_path = 'root'::ltree;
--        ELSEIF TG_OP = 'INSERT' OR OLD.parent_id IS NULL OR OLD.parent_id != NEW.parent_id THEN
--            SELECT parent_path || id::text FROM section WHERE id = NEW.parent_id INTO path;
--            IF path IS NULL THEN
--                RAISE EXCEPTION 'Invalid parent_id %', NEW.parent_id;
--            END IF;
--            NEW.parent_path = path;
--        END IF;
--        RETURN NEW;
--    END;
--$$ LANGUAGE plpgsql;
--
--CREATE TRIGGER parent_path_tgr
--    BEFORE INSERT OR UPDATE ON section
--    FOR EACH ROW EXECUTE PROCEDURE update_section_parent_path();
