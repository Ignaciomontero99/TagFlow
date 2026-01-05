-- ==========================================
-- TAGFLOW - DATABASE SCHEMA + INITIAL DATA
-- ==========================================

CREATE DATABASE IF NOT EXISTS tagflow
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE tagflow;

SET FOREIGN_KEY_CHECKS = 0;

-- =====================
-- DROP TABLES
-- =====================
DROP TABLE IF EXISTS post_tag;
DROP TABLE IF EXISTS saved_posts;
DROP TABLE IF EXISTS reactions;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS notifications;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS user_topic;
DROP TABLE IF EXISTS follows;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS users;

SET FOREIGN_KEY_CHECKS = 1;

-- =====================
-- USERS
-- =====================
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  profile_image VARCHAR(512),
  bio TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- =====================
-- TAGS (GENERIC / PARENTS)
-- =====================
CREATE TABLE tags (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  parent_id INT DEFAULT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  INDEX ix_tags_parent (parent_id),
  CONSTRAINT fk_tags_parent
    FOREIGN KEY (parent_id) REFERENCES tags(id)
    ON DELETE SET NULL ON UPDATE CASCADE
);

-- =====================
-- FOLLOWS
-- =====================
CREATE TABLE follows (
  id INT AUTO_INCREMENT PRIMARY KEY,
  follower_id INT NOT NULL,
  followed_id INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY ux_follow (follower_id, followed_id),
  FOREIGN KEY (follower_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (followed_id) REFERENCES users(id) ON DELETE CASCADE
);

-- =====================
-- USER_TOPIC
-- =====================
CREATE TABLE user_topic (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  tag_id INT NOT NULL,
  content TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY ux_user_topic (user_id, tag_id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- =====================
-- POSTS
-- =====================
CREATE TABLE posts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  content TEXT,
  image_url VARCHAR(512),
  is_ad BOOLEAN DEFAULT FALSE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- =====================
-- POST_TAG (N:M)
-- =====================
CREATE TABLE post_tag (
  post_id INT NOT NULL,
  tag_id INT NOT NULL,
  PRIMARY KEY (post_id, tag_id),
  FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
  FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- =====================
-- COMMENTS
-- =====================
CREATE TABLE comments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  post_id INT NOT NULL,
  content TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE
);

-- =====================
-- REACTIONS
-- =====================
CREATE TABLE reactions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  post_id INT NOT NULL,
  type varchar(20) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY ux_reaction (user_id, post_id, type),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE
);

-- =====================
-- SAVED POSTS
-- =====================
CREATE TABLE saved_posts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  post_id INT NOT NULL,
  saved_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY ux_saved (user_id, post_id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE
);

-- =====================
-- MESSAGES
-- =====================
CREATE TABLE messages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  sender_id INT NOT NULL,
  receiver_id INT NOT NULL,
  content TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (receiver_id) REFERENCES users(id) ON DELETE CASCADE
);

-- =====================
-- NOTIFICATIONS
-- =====================
CREATE TABLE notifications (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  sender_id INT,
  type VARCHAR(50),
  message TEXT,
  is_read BOOLEAN DEFAULT FALSE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE SET NULL
);

-- =====================
-- INSERT DATA
-- =====================

-- USERS
INSERT INTO users (name, email, password, bio) VALUES
('Ignacio', 'ignacio@tagflow.com', 'hashed_password', 'Tecnología y desarrollo'),
('Laura', 'laura@tagflow.com', 'hashed_password', 'Cine y series'),
('Carlos', 'carlos@tagflow.com', 'hashed_password', 'Videojuegos y tecnología'),
('Ana', 'ana@tagflow.com', 'hashed_password', 'Fotografía y viajes'),
('David', 'david@tagflow.com', 'hashed_password', 'Música y conciertos');

-- TAGS (GENERIC)
INSERT INTO tags (name) VALUES
('Películas'),
('Música'),
('Series'),
('Videojuegos'),
('Tecnología'),
('Deportes'),
('Arte'),
('Viajes'),
('Ciencia'),
('Educación');

-- USER_TOPIC
INSERT INTO user_topic (user_id, tag_id) VALUES
(1, 5),
(2, 1),
(3, 4),
(4, 8),
(5, 2);

-- POSTS
INSERT INTO posts (user_id, content) VALUES
(1, 'Explorando Symfony y MySQL'),
(2, 'Mi película favorita'),
(3, 'Jugando a mi último videojuego'),
(4, 'Fotos de mi último viaje'),
(5, 'Mis canciones favoritas');

-- POST_TAG
INSERT INTO post_tag (post_id, tag_id) VALUES
(1, 5),
(2, 1),
(3, 4),
(4, 8),
(5, 2);

-- COMMENTS
INSERT INTO comments (user_id, post_id, content) VALUES
(2, 1, 'Muy interesante'),
(3, 2, 'Totalmente de acuerdo'),
(4, 3, 'Buen juego'),
(5, 4, 'Qué bonito lugar');

-- REACTIONS
INSERT INTO reactions (user_id, post_id, type) VALUES
(2, 1, 'like'),
(3, 2, 'love'),
(4, 3, 'wow'),
(5, 4, 'like');

-- SAVED POSTS
INSERT INTO saved_posts (user_id, post_id) VALUES
(1, 2),
(2, 3),
(3, 1);

-- MESSAGES
INSERT INTO messages (sender_id, receiver_id, content) VALUES
(1, 2, 'Hola Laura'),
(2, 1, 'Hola Ignacio');

-- NOTIFICATIONS
INSERT INTO notifications (user_id, sender_id, type, message) VALUES
(1, 2, 'follow', 'Laura te ha seguido'),
(2, 1, 'message', 'Ignacio te ha enviado un mensaje');

-- ==========================================
-- END OF FILE
-- ==========================================
