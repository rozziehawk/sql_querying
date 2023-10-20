-- Using database products_db
1) insert into products (name, price, can_be_returned) values ('chair', 44.00, false);
2) INSERT INTO products (name, price, can_be_returned) VALUES ('stool', 25.99, true);
3) INSERT INTO products (name, price, can_be_returned) VALUES ('table', 124.00, false);
4) SELECT * FROM products;
5) SELECT name FROM products;
6) SELECT name, price FROM products;
7) INSERT INTO products (name, price, can_be_returned) VALUES ('widget', 99.00, true);
8) SELECT * FROM  products WHERE can_be_returned = true;
9) SELECT * FROM products WHERE price < 44;
10) SELECT * FROM products WHERE price BETWEEN 22.50 AND 99.99
11) UPDATE PRODUCTS SET price = price - 20.00;
12) DELETE FROM products WHERE price < 25.0;
13) UPDATE PRODUCTS SET price = price + 20.0;
14) UPDATE products SET can_be_returned = true;

-- using database playstore
1) SELECT app_name FROM analytics WHERE id = 1880;
2) SELECT id, app_name, last_updated FROM analytics WHERE last_updated = '2018-08-01';
3) SELECT category, COUNT(app_name) FROM analytics GROUP BY category ORDER BY category;
4) SELECT app_name, reviews FROM analytics ORDER BY reviews DESC limit 5;
5) SELECT app_name, rating, reviews FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 5;
6) SELECT category, AVG(rating) AS avg_rating FROM analytics GROUP BY category ORDER BY avg_rating DESC;
7) SELECT app_name, price, rating FROM analytics WHERE rating < 3.0 ORDER BY price DESC LIMIT 1;
8) SELECT app_name, rating, min_installs FROM analytics WHERE min_installs <=50 AND rating IS NOT null ORDER BY rating DESC;
9) SELECT app_name, rating, reviews FROM analytics WHERE rating < 3 AND reviews > 10000;
10)
11) SELECT app_name, last_updated FROM analytics WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);
12) SELECT app_name, price FROM analytics WHERE price = (SELECT MAX(price) FROM analytics);
13) SELECT SUM(reviews) AS total_reviews FROM analytics;
14) SELECT category, count(*) FROM analytics
  GROUP BY category
  HAVING COUNT(*) > 300;
15) SELECT app_name, min_installs, reviews, min_installs / reviews as proportion FROM analytics WHERE min_installs >= 100000 ORDER BY proportion DESC LIMIT 1;

-- Further study questions:
-- FS1) #their answer (I am not sure how the query output I get answers the question.:
SELECT app_name, rating, category FROM analytics
  WHERE (rating, category) in (
    SELECT MAX(rating), category FROM analytics
      WHERE min_installs >= 50000
      GROUP BY category
    )
  ORDER BY category;
FS2) SELECT app_name from analytics WHERE app_name ILIKE '%facebook%';
FS3) SELECT app_name, ARRAY_LENGTH(genres, 1)  AS num_genres FROM analytics WHERE ARRAY_LENGTH(genres,1) > 1; ORDER BY num_genres;
FS4) SELECT app_name, genres FROM analytics WHERE 'education' ILIKE ANY(genres);
