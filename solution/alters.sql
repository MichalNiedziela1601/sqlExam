-- Write your solution here


ALTER TABLE users
ADD CONSTRAINT nickname_uniq UNIQUE (nickname),
ADD CONSTRAINT email_uniq UNIQUE (email),
ADD COLUMN address_id INT;
ALTER TABLE users
ADD CONSTRAINT address_id_fkey FOREIGN KEY (address_id) REFERENCES address(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE product
ADD COLUMN user_id INT;

ALTER TABLE product
ADD CONSTRAINT user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE orders
ADD COLUMN product_id INT,
ADD COLUMN user_id INT;

ALTER TABLE orders
ADD CONSTRAINT product_id_fkey FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE assessment
ADD COLUMN product_id INT,
ADD COLUMN user_id INT;

ALTER TABLE assessment
ADD CONSTRAINT product_id_fkey FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE address
ADD CONSTRAINT address_unique UNIQUE(street,number,city,zip_code,country);


