CREATE DATABASE SocialMedia;

USE SocialMedia;

-- Users Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    signup_date DATE NOT NULL
);

-- Posts Table
CREATE TABLE Posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    post_date DATETIME NOT NULL,
    content TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users (user_id) ON DELETE CASCADE
);

-- Likes Table
CREATE TABLE Likes (
    like_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    like_date DATETIME NOT NULL,
    FOREIGN KEY (post_id) REFERENCES Posts (post_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users (user_id) ON DELETE CASCADE
);

-- Comments Table
CREATE TABLE Comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    comment_date DATETIME NOT NULL,
    content TEXT NOT NULL,
    FOREIGN KEY (post_id) REFERENCES Posts (post_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users (user_id) ON DELETE CASCADE
);

-- Show Tables
SHOW TABLES;

-- Insert Sample Data into Users Table
INSERT INTO Users (username, email, signup_date) VALUES
    ('john_doe', 'john@example.com', '2024-01-01'),
    ('jane_smith', 'jane@example.com', '2024-02-01'),
    ('alice_wonder', 'alice@example.com', '2024-02-05');

-- Insert Sample Data into Posts Table
INSERT INTO Posts (user_id, post_date, content) VALUES
    (1, '2025-02-01', 'Post 1 content'),
    (2, '2025-02-02', 'Post 2 content'),
    (3, '2025-02-03', 'Post 3 content');

-- Insert Sample Data into Likes Table
INSERT INTO Likes (post_id, user_id, like_date) VALUES
    (1, 1, '2025-02-01'),
    (1, 2, '2025-02-02'),
    (1, 3, '2025-02-03'),
    (2, 1, '2025-02-01'),
    (2, 2, '2025-02-02'),
    (3, 3, '2025-02-03');

-- Insert Sample Data into Comments Table
INSERT INTO Comments (post_id, user_id, comment_date, content) VALUES
    (1, 1, '2025-02-01', 'Great post!'),
    (1, 2, '2025-02-02', 'Interesting perspective.'),
    (2, 2, '2025-02-02', 'Nice work!'),
    (3, 3, '2025-02-03', 'Love this post.');

-- SQL Queries

-- 1. Find the most active users who have liked more than 10 posts in the last week.
SELECT u.user_id, u.username, COUNT(l.like_id) AS likes_count
FROM Users u
JOIN Likes l ON u.user_id = l.user_id
WHERE l.like_date >= CURDATE() - INTERVAL 7 DAY
GROUP BY u.user_id
HAVING likes_count > 10;

-- 2. Display the posts with the most comments and likes.
SELECT p.post_id, p.content, COUNT(l.like_id) AS likes_count, COUNT(c.comment_id) AS comments_count
FROM Posts p
LEFT JOIN Likes l ON p.post_id = l.post_id
LEFT JOIN Comments c ON p.post_id = c.post_id
GROUP BY p.post_id
ORDER BY likes_count DESC, comments_count DESC;

-- 3. Find the users who have commented on more than 5 posts in the last month.
SELECT u.user_id, u.username, COUNT(c.comment_id) AS comments_count
FROM Users u
JOIN Comments c ON u.user_id = c.user_id
WHERE c.comment_date >= CURDATE() - INTERVAL 1 MONTH
GROUP BY u.user_id
HAVING comments_count > 5;

-- 4. Find the top 5 most popular posts (based on total interactions - likes + comments).
SELECT p.post_id, p.content, COUNT(l.like_id) + COUNT(c.comment_id) AS total_interactions
FROM Posts p
LEFT JOIN Likes l ON p.post_id = l.post_id
LEFT JOIN Comments c ON p.post_id = c.post_id
GROUP BY p.post_id
ORDER BY total_interactions DESC
LIMIT 5;

-- 5. Find the users who have signed up but have not liked or commented on any post.
SELECT u.user_id, u.username
FROM Users u
LEFT JOIN Likes l ON u.user_id = l.user_id
LEFT JOIN Comments c ON u.user_id = c.user_id
WHERE l.like_id IS NULL AND c.comment_id IS NULL;
