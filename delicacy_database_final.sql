-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- PostgreSQL version: 9.2
-- Project Site: pgmodeler.com.br
-- Model Author: ---

SET check_function_bodies = false;
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: new_database | type: DATABASE --
-- CREATE DATABASE new_database
-- ;
-- -- ddl-end --
-- 

-- object: public.books | type: TABLE --
CREATE TABLE public.books(
	product_id bigint,
	publisher bigint,
	publisher_local bigint,
	isbn varchar(18),
	format varchar(50),
	pages_count bigint,
	CONSTRAINT "pk_id_Book" PRIMARY KEY (product_id)

);
-- ddl-end --
COMMENT ON COLUMN public.books.product_id IS 'ID Книги';
-- ddl-end --
COMMENT ON COLUMN public.books.publisher IS 'Издатель';
-- ddl-end --
COMMENT ON COLUMN public.books.publisher_local IS 'Издатель в России';
-- ddl-end --
COMMENT ON COLUMN public.books.isbn IS 'ISBN-кодировка книги';
-- ddl-end --
COMMENT ON COLUMN public.books.format IS 'формат';
-- ddl-end --
COMMENT ON COLUMN public.books.pages_count IS 'Количество страниц';
-- ddl-end --
COMMENT ON CONSTRAINT "pk_id_Book" ON public.books IS 'Id_Book';
-- ddl-end --
-- ddl-end --

-- object: public.orders | type: TABLE --
CREATE TABLE public.orders(
	order_id bigserial,
	user_id bigint,
	identifier varchar(24),
	date_of_creation timestamp NOT NULL,
	status varchar(200) NOT NULL,
	note text,
	CONSTRAINT pk_order_id PRIMARY KEY (order_id)

);
-- ddl-end --
-- object: public.users | type: TABLE --
CREATE TABLE public.users(
	user_id bigserial,
	login varchar(200),
	password_hash varchar(1000),
	name varchar(1000),
	surname varchar(1000),
	phone_number varchar(11),
	ip_address varchar(1000),
	last_visited_date date,
	status varchar(20) NOT NULL,
	role varchar(1000) NOT NULL,
	registration_date date,
	email varchar(200),
	link varchar(1000),
	CONSTRAINT pk_user_id PRIMARY KEY (user_id)

);
-- ddl-end --
-- object: public.order_items | type: TABLE --
CREATE TABLE public.order_items(
	order_item_id bigserial,
	order_id bigint,
	product_id bigint,
	amount bigint,
	CONSTRAINT pk_order_item_id PRIMARY KEY (order_item_id)

);
-- ddl-end --
-- object: public.attributes | type: TABLE --
CREATE TABLE public.attributes(
	product_id bigserial,
	height bigint,
	manufacturer bigint,
	series varchar(200),
	material varchar(100),
	CONSTRAINT pk_id_attributes PRIMARY KEY (product_id)

);
-- ddl-end --
COMMENT ON COLUMN public.attributes.product_id IS 'ID Книги';
-- ddl-end --
COMMENT ON CONSTRAINT pk_id_attributes ON public.attributes IS 'Id_Book';
-- ddl-end --
-- ddl-end --

-- object: public.products | type: TABLE --
CREATE TABLE public.products(
	product_id bigserial,
	title varchar(200) NOT NULL,
	type bigint,
	description varchar(10000),
	price decimal(15,2),
	remainder bigint,
	date date,
	CONSTRAINT pk_product_id_products PRIMARY KEY (product_id),
	CONSTRAINT un_title UNIQUE (title)

);
-- ddl-end --
COMMENT ON COLUMN public.products.product_id IS 'ID Книги';
-- ddl-end --
COMMENT ON COLUMN public.products.title IS 'Название книги';
-- ddl-end --
COMMENT ON CONSTRAINT pk_product_id_products ON public.products IS 'Id_Book';
-- ddl-end --
-- ddl-end --

-- object: public.subjects | type: TABLE --
CREATE TABLE public.subjects(
	subject_id bigserial,
	name varchar(200) NOT NULL,
	description text,
	type varchar(50) NOT NULL,
	CONSTRAINT pk_subject_id PRIMARY KEY (subject_id)

);
-- ddl-end --
-- object: public.products_authors | type: TABLE --
CREATE TABLE public.products_authors(
	product_id bigint NOT NULL,
	subject_id bigint NOT NULL
);
-- ddl-end --
-- object: public.products_artists | type: TABLE --
CREATE TABLE public.products_artists(
	product_id bigint NOT NULL,
	subject_id bigint NOT NULL
);
-- ddl-end --
-- object: public.products_tags | type: TABLE --
CREATE TABLE public.products_tags(
	product_id bigint NOT NULL,
	tag_id bigint NOT NULL,
	CONSTRAINT pk_product_id_tag_id_products_tags PRIMARY KEY (product_id,tag_id)

);
-- ddl-end --
-- object: public.tags | type: TABLE --
CREATE TABLE public.tags(
	tag_id serial,
	title varchar(200) NOT NULL,
	CONSTRAINT pk_tag_id PRIMARY KEY (tag_id)

);
-- ddl-end --
-- object: public.pictures | type: TABLE --
CREATE TABLE public.pictures(
	picture_id bigserial,
	product_id bigint,
	show_order bigint,
	CONSTRAINT pk_picture_id PRIMARY KEY (picture_id)

);
-- ddl-end --
-- object: fk_product_id_books | type: CONSTRAINT --
ALTER TABLE public.books ADD CONSTRAINT fk_product_id_books FOREIGN KEY (product_id)
REFERENCES public.products (product_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_publisher_books_subject | type: CONSTRAINT --
ALTER TABLE public.books ADD CONSTRAINT fk_publisher_books_subject FOREIGN KEY (publisher)
REFERENCES public.subjects (subject_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_publisher_local_books_subjects | type: CONSTRAINT --
ALTER TABLE public.books ADD CONSTRAINT fk_publisher_local_books_subjects FOREIGN KEY (publisher_local)
REFERENCES public.subjects (subject_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_user_id | type: CONSTRAINT --
ALTER TABLE public.orders ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id)
REFERENCES public.users (user_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_order_id | type: CONSTRAINT --
ALTER TABLE public.order_items ADD CONSTRAINT fk_order_id FOREIGN KEY (order_id)
REFERENCES public.orders (order_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_product_id_order_items | type: CONSTRAINT --
ALTER TABLE public.order_items ADD CONSTRAINT fk_product_id_order_items FOREIGN KEY (product_id)
REFERENCES public.products (product_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_product_id_attributes | type: CONSTRAINT --
ALTER TABLE public.attributes ADD CONSTRAINT fk_product_id_attributes FOREIGN KEY (product_id)
REFERENCES public.products (product_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_manufacturer_attributes_subjects | type: CONSTRAINT --
ALTER TABLE public.attributes ADD CONSTRAINT fk_manufacturer_attributes_subjects FOREIGN KEY (manufacturer)
REFERENCES public.subjects (subject_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_type_products_subjects | type: CONSTRAINT --
ALTER TABLE public.products ADD CONSTRAINT fk_type_products_subjects FOREIGN KEY (type)
REFERENCES public.subjects (subject_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_product_id | type: CONSTRAINT --
ALTER TABLE public.products_authors ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id)
REFERENCES public.books (product_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_subject_id | type: CONSTRAINT --
ALTER TABLE public.products_authors ADD CONSTRAINT fk_subject_id FOREIGN KEY (subject_id)
REFERENCES public.subjects (subject_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_product_id | type: CONSTRAINT --
ALTER TABLE public.products_artists ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id)
REFERENCES public.books (product_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_subject_id | type: CONSTRAINT --
ALTER TABLE public.products_artists ADD CONSTRAINT fk_subject_id FOREIGN KEY (subject_id)
REFERENCES public.subjects (subject_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_product_id | type: CONSTRAINT --
ALTER TABLE public.products_tags ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id)
REFERENCES public.products (product_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_tag_id | type: CONSTRAINT --
ALTER TABLE public.products_tags ADD CONSTRAINT fk_tag_id FOREIGN KEY (tag_id)
REFERENCES public.tags (tag_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --


-- object: fk_product_id_pictures_products | type: CONSTRAINT --
ALTER TABLE public.pictures ADD CONSTRAINT fk_product_id_pictures_products FOREIGN KEY (product_id)
REFERENCES public.products (product_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE;
-- ddl-end --



