CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE articles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    UNIQUE(username),
    UNIQUE(email)
);

CREATE TABLE ratings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    article_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    user_id INT,
    ip_address VARCHAR(45),
    FOREIGN KEY (article_id) REFERENCES articles(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    UNIQUE(article_id, user_id, ip_address)
);

CREATE TABLE comments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    article_id INT NOT NULL,
    user_id INT,
    ip_address VARCHAR(45),
    content TEXT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (article_id) REFERENCES articles(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    CHECK ((user_id IS NOT NULL AND ip_address IS NULL) OR 
           (user_id IS NULL AND ip_address IS NOT NULL))
);
