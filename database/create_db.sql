DROP SCHEMA IF EXISTS pocket CASCADE;
CREATE SCHEMA pocket;

DROP TABLE IF EXISTS pocket.users;
CREATE TABLE pocket.users (
    id BIGSERIAL PRIMARY KEY,
    username TEXT,
    password TEXT,
    roles TEXT
);


DROP TABLE IF EXISTS pocket.book;
CREATE TABLE pocket.book(
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT,
    title TEXT,
    current_page BIGINT,
    total_page BIGINT,
    path_to_image TEXT,
    CONSTRAINT user_id_fkey FOREIGN KEY (user_id) REFERENCES pocket.users(id)
);

DROP TABLE IF EXISTS pocket.category;
CREATE TABLE pocket.category(
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT,
    category TEXT,
    CONSTRAINT user_id_fkey FOREIGN KEY (user_id) REFERENCES pocket.users(id)
);

DROP TABLE IF EXISTS pocket.book_category;
CREATE TABLE pocket.book_category(
    book_id BIGINT,
    category_id BIGINT,
    CONSTRAINT book_id_fkey FOREIGN KEY (book_id) REFERENCES pocket.book(id),
    CONSTRAINT category_id_fkey FOREIGN KEY (category_id) REFERENCES pocket.category(id)
)