
USE sql11519894;

CREATE TABLE user
(
  user_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL,
  image VARCHAR(150),
  role_id INT,
  PRIMARY KEY (user_id)
);


CREATE TABLE role
(
	role_id INT NOT NULL AUTO_INCREMENT,
    role_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (role_id)
);

CREATE TABLE user_role
(
	role_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY (role_id, user_id)
);

# Link the user table with role table
# this is a many to many relation so we need a table to link them

ALTER TABLE user_role
	Add FOREIGN KEY(role_id) 
		REFERENCES role (role_id)
        ON DELETE CASCADE
		ON UPDATE CASCADE;
        
ALTER TABLE user_role
	Add FOREIGN KEY(user_id) 
		REFERENCES user (user_id)
        ON DELETE CASCADE
		ON UPDATE CASCADE;


CREATE TABLE product
(
  product_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  quantity INT DEFAULT 0,
  small_price INT NOT NULL,
  medium_price INT NOT NULL,
  large_price INT NOT NULL,
  image VARCHAR(150) NOT NULL,
  image_svg VARCHAR(150) NOT NULL,
  PRIMARY KEY (product_id)
);


CREATE TABLE cart
(
  user_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL ,
  size INT NOT NULL,   # values = 1, 2, 3
  sugar INT NOT NULL,   # values = 0, 1, 2, 3
  PRIMARY KEY (user_id, product_id),
  FOREIGN KEY (user_id)
      REFERENCES user(user_id)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
  FOREIGN KEY (product_id)
      REFERENCES product(product_id)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);