-- Write your solution here

CREATE SEQUENCE email_id START 1;
ALTER TABle users
ADD COLUMN email TEXT DEFAULT 'test' || nextval('email_id') || '@test.com' NOT NULL UNIQUE;



