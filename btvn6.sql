USE sakila;

-- Bài tập 1: Lấy danh sách các bộ phim (films) thuộc thể loại “Action.”
SELECT film.film_id, film.title, category.name
FROM film
INNER JOIN film_category
ON film.film_id = film_category.film_id
INNER JOIN category
ON category.category_id = film_category.category_id
WHERE category.name = 'Action';

-- Bài tập 2: Lấy danh sách các bộ phim (films) và thể loại (categories) của chúng.
SELECT film.film_id, film.title, category.name
FROM film
INNER JOIN film_category
ON film.film_id = film_category.film_id
INNER JOIN category
ON category.category_id = film_category.category_id;

-- Bài tập 3: Lấy danh sách các bộ phim (films) và số lượng thể loại (categories) của mỗi bộ phim.
SELECT film.film_id, film.title, COUNT(category.category_id) as categories
FROM film
INNER JOIN film_category
ON film.film_id = film_category.film_id
INNER JOIN category
ON category.category_id = film_category.category_id
GROUP BY film.film_id, film.title;

-- Bài tập 4: Lấy danh sách các bộ phim (films) và thể loại (categories) của bộ phim có rating “PG-13.”
SELECT film.film_id, film.title, category.name as categories, film.rating
FROM film
INNER JOIN film_category
ON film.film_id = film_category.film_id
INNER JOIN category
ON category.category_id = film_category.category_id
WHERE film.rating = 'PG-13';

-- Bài tập 5: Lấy danh sách các diễn viên (actors) và số lượng bộ phim (films) thuộc thể loại “Family,” sắp xếp theo số lượng bộ phim giảm dần
SELECT actor.first_name, actor.last_name, category.name, COUNT(film.film_id) as number_of_films
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film.film_id = film_actor.film_id
INNER JOIN film_category
ON film.film_id = film_category.film_id
INNER JOIN category
ON category.category_id = film_category.category_id
WHERE category.name = 'Family'
GROUP BY actor.first_name, actor.last_name, category.name
ORDER BY number_of_films DESC;

-- Bài tập 6: Lấy danh sách các bộ phim (films) và số lượng diễn viên (actors) tham gia, sắp xếp theo số lượng diễn viên giảm dần.
SELECT film.title, COUNT(actor.actor_id) as number_of_actors
FROM film
INNER JOIN film_actor
ON film.film_id = film_actor.film_id
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id
GROUP BY film.film_id
ORDER BY number_of_actors DESC;

-- Bài tập 7: Lấy danh sách tất cả diễn viên (actors) có họ là “Smith” và tên bắt đầu bằng “J.”
SELECT * FROM actor
WHERE last_name = 'Smith'
AND first_name LIKE 'J%';

-- Bài tập 8: Lấy danh sách các bộ phim (films) phát hành trong năm 2015 với tổng doanh thu (revenue) lớn hơn 5000.
SELECT film_id, title, SUM(rental_duration * rental_rate) as revenue 
FROM film
WHERE release_year = 2015
GROUP BY film_id;

-- Bài tập 9: Lấy danh sách bộ phim (films) và ngôn ngữ (language) của từng bộ phim.
SELECT film.title, language.name
FROM film
INNER JOIN language
ON film.language_id = language.language_id;

-- Bài tập 10. Lấy danh sách bộ phim có tên(title) bắt đầu bằng chữ ‘I’ và kết thúc bằng chữ N
SELECT title FROM film
WHERE title LIKE 'I%N';