CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),
    email VARCHAR(100)
);
CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);
CREATE TABLE articles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT,
    title VARCHAR(255),
    content TEXT,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);
CREATE TABLE ratings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    article_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    ip_address VARCHAR(45),
    UNIQUE(article_id, ip_address)
);