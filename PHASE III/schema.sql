--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: game_store_app; Type: SCHEMA; Schema: -; Owner: game_store_app
--

CREATE SCHEMA game_store_app;


ALTER SCHEMA game_store_app OWNER TO game_store_app;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin; Type: TABLE; Schema: game_store_app; Owner: game_store_app
--

CREATE TABLE game_store_app.admin (
    admin_id integer NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    CONSTRAINT admin_email_check CHECK ((email ~* '^\w+@\w+[.]\w+$'::text)),
    CONSTRAINT admin_password_check CHECK ((char_length(password) >= 8))
);


ALTER TABLE game_store_app.admin OWNER TO game_store_app;

--
-- Name: admin_admin_id_seq; Type: SEQUENCE; Schema: game_store_app; Owner: game_store_app
--

CREATE SEQUENCE game_store_app.admin_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE game_store_app.admin_admin_id_seq OWNER TO game_store_app;

--
-- Name: admin_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: game_store_app; Owner: game_store_app
--

ALTER SEQUENCE game_store_app.admin_admin_id_seq OWNED BY game_store_app.admin.admin_id;


--
-- Name: cart; Type: TABLE; Schema: game_store_app; Owner: game_store_app
--

CREATE TABLE game_store_app.cart (
    cart_id integer NOT NULL,
    item_id integer NOT NULL,
    customer_id integer NOT NULL,
    total_cost double precision NOT NULL
);


ALTER TABLE game_store_app.cart OWNER TO game_store_app;

--
-- Name: cart_cart_id_seq; Type: SEQUENCE; Schema: game_store_app; Owner: game_store_app
--

CREATE SEQUENCE game_store_app.cart_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE game_store_app.cart_cart_id_seq OWNER TO game_store_app;

--
-- Name: cart_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: game_store_app; Owner: game_store_app
--

ALTER SEQUENCE game_store_app.cart_cart_id_seq OWNED BY game_store_app.cart.cart_id;


--
-- Name: cart_customer_id_seq; Type: SEQUENCE; Schema: game_store_app; Owner: game_store_app
--

CREATE SEQUENCE game_store_app.cart_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE game_store_app.cart_customer_id_seq OWNER TO game_store_app;

--
-- Name: cart_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: game_store_app; Owner: game_store_app
--

ALTER SEQUENCE game_store_app.cart_customer_id_seq OWNED BY game_store_app.cart.customer_id;


--
-- Name: cart_item; Type: TABLE; Schema: game_store_app; Owner: game_store_app
--

CREATE TABLE game_store_app.cart_item (
    item_id integer NOT NULL,
    game_id bigint NOT NULL,
    quantity integer NOT NULL,
    unit_cost double precision NOT NULL,
    total_price double precision NOT NULL
);


ALTER TABLE game_store_app.cart_item OWNER TO game_store_app;

--
-- Name: cart_item_game_id_seq; Type: SEQUENCE; Schema: game_store_app; Owner: game_store_app
--

CREATE SEQUENCE game_store_app.cart_item_game_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE game_store_app.cart_item_game_id_seq OWNER TO game_store_app;

--
-- Name: cart_item_game_id_seq; Type: SEQUENCE OWNED BY; Schema: game_store_app; Owner: game_store_app
--

ALTER SEQUENCE game_store_app.cart_item_game_id_seq OWNED BY game_store_app.cart_item.game_id;


--
-- Name: cart_item_id_seq; Type: SEQUENCE; Schema: game_store_app; Owner: game_store_app
--

CREATE SEQUENCE game_store_app.cart_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE game_store_app.cart_item_id_seq OWNER TO game_store_app;

--
-- Name: cart_item_id_seq; Type: SEQUENCE OWNED BY; Schema: game_store_app; Owner: game_store_app
--

ALTER SEQUENCE game_store_app.cart_item_id_seq OWNED BY game_store_app.cart.item_id;


--
-- Name: cart_item_item_id_seq; Type: SEQUENCE; Schema: game_store_app; Owner: game_store_app
--

CREATE SEQUENCE game_store_app.cart_item_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE game_store_app.cart_item_item_id_seq OWNER TO game_store_app;

--
-- Name: cart_item_item_id_seq; Type: SEQUENCE OWNED BY; Schema: game_store_app; Owner: game_store_app
--

ALTER SEQUENCE game_store_app.cart_item_item_id_seq OWNED BY game_store_app.cart_item.item_id;


--
-- Name: customer; Type: TABLE; Schema: game_store_app; Owner: game_store_app
--

CREATE TABLE game_store_app.customer (
    customer_id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL,
    username text NOT NULL,
    address text NOT NULL,
    password text NOT NULL,
    CONSTRAINT customer_check CHECK (((first_name !~ '\s'::text) AND (last_name !~ '\s'::text))),
    CONSTRAINT customer_email_check CHECK ((email ~* '^\w+@\w+[.]\w+$'::text)),
    CONSTRAINT customer_password_check CHECK ((char_length(password) >= 8))
);


ALTER TABLE game_store_app.customer OWNER TO game_store_app;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: game_store_app; Owner: game_store_app
--

CREATE SEQUENCE game_store_app.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE game_store_app.customer_customer_id_seq OWNER TO game_store_app;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: game_store_app; Owner: game_store_app
--

ALTER SEQUENCE game_store_app.customer_customer_id_seq OWNED BY game_store_app.customer.customer_id;


--
-- Name: developer; Type: TABLE; Schema: game_store_app; Owner: game_store_app
--

CREATE TABLE game_store_app.developer (
    dev_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE game_store_app.developer OWNER TO game_store_app;

--
-- Name: game; Type: TABLE; Schema: game_store_app; Owner: game_store_app
--

CREATE TABLE game_store_app.game (
    game_id bigint NOT NULL,
    dev_id integer NOT NULL,
    title text NOT NULL,
    release_date date NOT NULL,
    genre text NOT NULL,
    rating integer NOT NULL,
    number_of_sales integer NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE game_store_app.game OWNER TO game_store_app;

--
-- Name: game_game_id_seq; Type: SEQUENCE; Schema: game_store_app; Owner: game_store_app
--

CREATE SEQUENCE game_store_app.game_game_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE game_store_app.game_game_id_seq OWNER TO game_store_app;

--
-- Name: game_game_id_seq; Type: SEQUENCE OWNED BY; Schema: game_store_app; Owner: game_store_app
--

ALTER SEQUENCE game_store_app.game_game_id_seq OWNED BY game_store_app.game.game_id;


--
-- Name: game_number_of_sales_seq; Type: SEQUENCE; Schema: game_store_app; Owner: game_store_app
--

CREATE SEQUENCE game_store_app.game_number_of_sales_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE game_store_app.game_number_of_sales_seq OWNER TO game_store_app;

--
-- Name: game_number_of_sales_seq; Type: SEQUENCE OWNED BY; Schema: game_store_app; Owner: game_store_app
--

ALTER SEQUENCE game_store_app.game_number_of_sales_seq OWNED BY game_store_app.game.number_of_sales;


--
-- Name: payment; Type: TABLE; Schema: game_store_app; Owner: game_store_app
--

CREATE TABLE game_store_app.payment (
    payment_id integer NOT NULL,
    amount double precision NOT NULL,
    payment_type boolean NOT NULL
);


ALTER TABLE game_store_app.payment OWNER TO game_store_app;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: game_store_app; Owner: game_store_app
--

CREATE SEQUENCE game_store_app.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE game_store_app.payment_payment_id_seq OWNER TO game_store_app;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: game_store_app; Owner: game_store_app
--

ALTER SEQUENCE game_store_app.payment_payment_id_seq OWNED BY game_store_app.payment.payment_id;


--
-- Name: admin admin_id; Type: DEFAULT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.admin ALTER COLUMN admin_id SET DEFAULT nextval('game_store_app.admin_admin_id_seq'::regclass);


--
-- Name: cart cart_id; Type: DEFAULT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.cart ALTER COLUMN cart_id SET DEFAULT nextval('game_store_app.cart_cart_id_seq'::regclass);


--
-- Name: cart item_id; Type: DEFAULT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.cart ALTER COLUMN item_id SET DEFAULT nextval('game_store_app.cart_item_id_seq'::regclass);


--
-- Name: cart customer_id; Type: DEFAULT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.cart ALTER COLUMN customer_id SET DEFAULT nextval('game_store_app.cart_customer_id_seq'::regclass);


--
-- Name: cart_item item_id; Type: DEFAULT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.cart_item ALTER COLUMN item_id SET DEFAULT nextval('game_store_app.cart_item_item_id_seq'::regclass);


--
-- Name: cart_item game_id; Type: DEFAULT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.cart_item ALTER COLUMN game_id SET DEFAULT nextval('game_store_app.cart_item_game_id_seq'::regclass);


--
-- Name: customer customer_id; Type: DEFAULT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.customer ALTER COLUMN customer_id SET DEFAULT nextval('game_store_app.customer_customer_id_seq'::regclass);


--
-- Name: game game_id; Type: DEFAULT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.game ALTER COLUMN game_id SET DEFAULT nextval('game_store_app.game_game_id_seq'::regclass);


--
-- Name: game number_of_sales; Type: DEFAULT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.game ALTER COLUMN number_of_sales SET DEFAULT nextval('game_store_app.game_number_of_sales_seq'::regclass);


--
-- Name: payment payment_id; Type: DEFAULT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.payment ALTER COLUMN payment_id SET DEFAULT nextval('game_store_app.payment_payment_id_seq'::regclass);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: game_store_app; Owner: game_store_app
--

COPY game_store_app.admin (admin_id, username, email, password) FROM stdin;
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: game_store_app; Owner: game_store_app
--

COPY game_store_app.cart (cart_id, item_id, customer_id, total_cost) FROM stdin;
\.


--
-- Data for Name: cart_item; Type: TABLE DATA; Schema: game_store_app; Owner: game_store_app
--

COPY game_store_app.cart_item (item_id, game_id, quantity, unit_cost, total_price) FROM stdin;
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: game_store_app; Owner: game_store_app
--

COPY game_store_app.customer (customer_id, first_name, last_name, email, username, address, password) FROM stdin;
\.


--
-- Data for Name: developer; Type: TABLE DATA; Schema: game_store_app; Owner: game_store_app
--

COPY game_store_app.developer (dev_id, name) FROM stdin;
\.


--
-- Data for Name: game; Type: TABLE DATA; Schema: game_store_app; Owner: game_store_app
--

COPY game_store_app.game (game_id, dev_id, title, release_date, genre, rating, number_of_sales, price) FROM stdin;
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: game_store_app; Owner: game_store_app
--

COPY game_store_app.payment (payment_id, amount, payment_type) FROM stdin;
\.


--
-- Name: admin_admin_id_seq; Type: SEQUENCE SET; Schema: game_store_app; Owner: game_store_app
--

SELECT pg_catalog.setval('game_store_app.admin_admin_id_seq', 1, false);


--
-- Name: cart_cart_id_seq; Type: SEQUENCE SET; Schema: game_store_app; Owner: game_store_app
--

SELECT pg_catalog.setval('game_store_app.cart_cart_id_seq', 1, false);


--
-- Name: cart_customer_id_seq; Type: SEQUENCE SET; Schema: game_store_app; Owner: game_store_app
--

SELECT pg_catalog.setval('game_store_app.cart_customer_id_seq', 1, false);


--
-- Name: cart_item_game_id_seq; Type: SEQUENCE SET; Schema: game_store_app; Owner: game_store_app
--

SELECT pg_catalog.setval('game_store_app.cart_item_game_id_seq', 1, false);


--
-- Name: cart_item_id_seq; Type: SEQUENCE SET; Schema: game_store_app; Owner: game_store_app
--

SELECT pg_catalog.setval('game_store_app.cart_item_id_seq', 1, false);


--
-- Name: cart_item_item_id_seq; Type: SEQUENCE SET; Schema: game_store_app; Owner: game_store_app
--

SELECT pg_catalog.setval('game_store_app.cart_item_item_id_seq', 1, false);


--
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: game_store_app; Owner: game_store_app
--

SELECT pg_catalog.setval('game_store_app.customer_customer_id_seq', 1, false);


--
-- Name: game_game_id_seq; Type: SEQUENCE SET; Schema: game_store_app; Owner: game_store_app
--

SELECT pg_catalog.setval('game_store_app.game_game_id_seq', 1, false);


--
-- Name: game_number_of_sales_seq; Type: SEQUENCE SET; Schema: game_store_app; Owner: game_store_app
--

SELECT pg_catalog.setval('game_store_app.game_number_of_sales_seq', 1, false);


--
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: game_store_app; Owner: game_store_app
--

SELECT pg_catalog.setval('game_store_app.payment_payment_id_seq', 1, false);


--
-- Name: admin admin_email_key; Type: CONSTRAINT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.admin
    ADD CONSTRAINT admin_email_key UNIQUE (email);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (admin_id);


--
-- Name: cart_item cart_item_pkey; Type: CONSTRAINT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.cart_item
    ADD CONSTRAINT cart_item_pkey PRIMARY KEY (item_id);


--
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cart_id);


--
-- Name: customer customer_email_key; Type: CONSTRAINT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.customer
    ADD CONSTRAINT customer_email_key UNIQUE (email);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- Name: developer developer_pkey; Type: CONSTRAINT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.developer
    ADD CONSTRAINT developer_pkey PRIMARY KEY (dev_id);


--
-- Name: game game_pkey; Type: CONSTRAINT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (game_id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);


--
-- Name: cart cart_customer_id_fkey; Type: FK CONSTRAINT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.cart
    ADD CONSTRAINT cart_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES game_store_app.customer(customer_id);


--
-- Name: cart_item cart_item_game_id_fkey; Type: FK CONSTRAINT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.cart_item
    ADD CONSTRAINT cart_item_game_id_fkey FOREIGN KEY (game_id) REFERENCES game_store_app.game(game_id);


--
-- Name: cart cart_item_id_fkey; Type: FK CONSTRAINT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.cart
    ADD CONSTRAINT cart_item_id_fkey FOREIGN KEY (item_id) REFERENCES game_store_app.cart_item(item_id);


--
-- Name: game game_dev_id_fkey; Type: FK CONSTRAINT; Schema: game_store_app; Owner: game_store_app
--

ALTER TABLE ONLY game_store_app.game
    ADD CONSTRAINT game_dev_id_fkey FOREIGN KEY (dev_id) REFERENCES game_store_app.developer(dev_id);


--
-- PostgreSQL database dump complete
--

