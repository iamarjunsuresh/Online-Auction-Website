--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: arjun
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO arjun;

--
-- Name: auction_items; Type: TABLE; Schema: public; Owner: arjun
--

CREATE TABLE auction_items (
    id bigint NOT NULL,
    auction_id integer,
    prod_id integer,
    winner_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE auction_items OWNER TO arjun;

--
-- Name: auction_items_id_seq; Type: SEQUENCE; Schema: public; Owner: arjun
--

CREATE SEQUENCE auction_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auction_items_id_seq OWNER TO arjun;

--
-- Name: auction_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arjun
--

ALTER SEQUENCE auction_items_id_seq OWNED BY auction_items.id;


--
-- Name: auctions; Type: TABLE; Schema: public; Owner: arjun
--

CREATE TABLE auctions (
    id bigint NOT NULL,
    admin_id integer,
    start_time character varying,
    end_time character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE auctions OWNER TO arjun;

--
-- Name: auctions_id_seq; Type: SEQUENCE; Schema: public; Owner: arjun
--

CREATE SEQUENCE auctions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auctions_id_seq OWNER TO arjun;

--
-- Name: auctions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arjun
--

ALTER SEQUENCE auctions_id_seq OWNED BY auctions.id;


--
-- Name: bidding_tables; Type: TABLE; Schema: public; Owner: arjun
--

CREATE TABLE bidding_tables (
    id bigint NOT NULL,
    auction_id integer,
    prod_id integer,
    "time" character varying,
    biding_price double precision,
    bidder_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE bidding_tables OWNER TO arjun;

--
-- Name: bidding_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: arjun
--

CREATE SEQUENCE bidding_tables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bidding_tables_id_seq OWNER TO arjun;

--
-- Name: bidding_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arjun
--

ALTER SEQUENCE bidding_tables_id_seq OWNED BY bidding_tables.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: arjun
--

CREATE TABLE categories (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE categories OWNER TO arjun;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: arjun
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO arjun;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arjun
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: arjun
--

CREATE TABLE notifications (
    id bigint NOT NULL,
    sender_id integer,
    recieve_id integer,
    message character varying,
    "time" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE notifications OWNER TO arjun;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: arjun
--

CREATE SEQUENCE notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE notifications_id_seq OWNER TO arjun;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arjun
--

ALTER SEQUENCE notifications_id_seq OWNED BY notifications.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: arjun
--

CREATE TABLE products (
    id bigint NOT NULL,
    category character varying,
    "desc" character varying,
    name character varying,
    image character varying,
    min_bid double precision,
    seller_id integer,
    auction_status character varying,
    verified_by integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE products OWNER TO arjun;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: arjun
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products_id_seq OWNER TO arjun;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arjun
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: arjun
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO arjun;

--
-- Name: users; Type: TABLE; Schema: public; Owner: arjun
--

CREATE TABLE users (
    id bigint NOT NULL,
    name character varying,
    addr character varying,
    gender character varying,
    usertype character varying,
    email character varying,
    phno character varying,
    verified_by integer,
    pwd character varying,
    salt character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE users OWNER TO arjun;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: arjun
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO arjun;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arjun
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: verifies; Type: TABLE; Schema: public; Owner: arjun
--

CREATE TABLE verifies (
    id bigint NOT NULL,
    userid integer,
    code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    date timestamp without time zone,
    expired integer
);


ALTER TABLE verifies OWNER TO arjun;

--
-- Name: verifies_id_seq; Type: SEQUENCE; Schema: public; Owner: arjun
--

CREATE SEQUENCE verifies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE verifies_id_seq OWNER TO arjun;

--
-- Name: verifies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arjun
--

ALTER SEQUENCE verifies_id_seq OWNED BY verifies.id;


--
-- Name: auction_items id; Type: DEFAULT; Schema: public; Owner: arjun
--

ALTER TABLE ONLY auction_items ALTER COLUMN id SET DEFAULT nextval('auction_items_id_seq'::regclass);


--
-- Name: auctions id; Type: DEFAULT; Schema: public; Owner: arjun
--

ALTER TABLE ONLY auctions ALTER COLUMN id SET DEFAULT nextval('auctions_id_seq'::regclass);


--
-- Name: bidding_tables id; Type: DEFAULT; Schema: public; Owner: arjun
--

ALTER TABLE ONLY bidding_tables ALTER COLUMN id SET DEFAULT nextval('bidding_tables_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: arjun
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: arjun
--

ALTER TABLE ONLY notifications ALTER COLUMN id SET DEFAULT nextval('notifications_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: arjun
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: arjun
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: verifies id; Type: DEFAULT; Schema: public; Owner: arjun
--

ALTER TABLE ONLY verifies ALTER COLUMN id SET DEFAULT nextval('verifies_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: arjun
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-09-17 11:39:09.557094	2017-09-17 11:39:09.557094
\.


--
-- Data for Name: auction_items; Type: TABLE DATA; Schema: public; Owner: arjun
--

COPY auction_items (id, auction_id, prod_id, winner_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: auction_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arjun
--

SELECT pg_catalog.setval('auction_items_id_seq', 1, false);


--
-- Data for Name: auctions; Type: TABLE DATA; Schema: public; Owner: arjun
--

COPY auctions (id, admin_id, start_time, end_time, created_at, updated_at) FROM stdin;
\.


--
-- Name: auctions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arjun
--

SELECT pg_catalog.setval('auctions_id_seq', 1, false);


--
-- Data for Name: bidding_tables; Type: TABLE DATA; Schema: public; Owner: arjun
--

COPY bidding_tables (id, auction_id, prod_id, "time", biding_price, bidder_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: bidding_tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arjun
--

SELECT pg_catalog.setval('bidding_tables_id_seq', 1, false);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: arjun
--

COPY categories (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arjun
--

SELECT pg_catalog.setval('categories_id_seq', 1, false);


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: arjun
--

COPY notifications (id, sender_id, recieve_id, message, "time", created_at, updated_at) FROM stdin;
\.


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arjun
--

SELECT pg_catalog.setval('notifications_id_seq', 1, false);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: arjun
--

COPY products (id, category, "desc", name, image, min_bid, seller_id, auction_status, verified_by, created_at, updated_at) FROM stdin;
4	\N	Good Condition ,HP Pavellion 15	Laptop	/uploads/130413444c05494889.png	20000	1	None	-1	2017-09-17 11:39:13.687955	2017-09-17 11:39:13.687955
5	\N	Car is for rich  person. 	Lamborgini Galardo	/uploads/7619746102012-Lamborghini-Gallardo-Trofeo-Stradale-Front-Quarter.jpg	6600000	1	None	-1	2017-09-17 11:39:13.705732	2017-09-17 11:39:13.705732
6	\N	askdhahfahjdhiuh	nkojnm	/uploads/83242234116712011_1233862760025071_5503894258318613670_n.jpg	256220	1	None	-1	2017-09-17 11:39:13.722434	2017-09-17 11:39:13.722434
2	\N	Furniture is red	Furniture Chair	/uploads/3279593777furniture.jpeg	35600	1	None	3	2017-09-17 11:39:13.653819	2017-09-17 14:16:00.372476
3	\N	gxm	mobile	/uploads/3538640648mathjax.png	500	1	None	3	2017-09-17 11:39:13.671557	2017-09-17 14:17:35.847756
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arjun
--

SELECT pg_catalog.setval('products_id_seq', 6, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: arjun
--

COPY schema_migrations (version) FROM stdin;
20170913134252
20170913134706
20170913134852
20170913135000
20170913135145
20170913135316
20170913182043
20170917151406
20170917165143
20170917165220
20170920154704
20170920194727
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: arjun
--

COPY users (id, name, addr, gender, usertype, email, phno, verified_by, pwd, salt, created_at, updated_at) FROM stdin;
13	ArjunSuresh	cherai,\r\nekm.\r\nkerala	Male	admin	\N	9495889419	-1	220df9a6fd4e35f1842a69e9543d7756ca598342	35534	2017-09-20 21:06:11.927212	2017-09-20 21:07:36.1874
14	HarshitJoshi	nitc	Male	admin	\N	1234567890	-1	2fef90304539984ef6b637936e9bfc1cd3bc025b	16748	2017-09-21 08:49:02.301406	2017-09-21 08:52:35.430854
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arjun
--

SELECT pg_catalog.setval('users_id_seq', 14, true);


--
-- Data for Name: verifies; Type: TABLE DATA; Schema: public; Owner: arjun
--

COPY verifies (id, userid, code, created_at, updated_at, date, expired) FROM stdin;
1	6	9222ed849d2ff93007001f3f4dee999e4e435aa8	2017-09-20 19:55:40.39228	2017-09-20 19:55:40.39228	2017-09-21 19:55:40.391385	0
2	7	6d591da7a5f01b755c76df9b54e118f14386879b	2017-09-20 20:02:03.067264	2017-09-20 20:02:03.067264	2017-09-21 20:02:03.06689	0
3	8	ff307d24fdbb3d3db2d91bedb331d2761cf275d8	2017-09-20 20:03:30.482745	2017-09-20 20:03:30.482745	2017-09-21 20:03:30.482125	0
4	9	1b65da45a619d463afb87da2fc0ad56f461cc3d4	2017-09-20 20:13:13.238003	2017-09-20 20:13:13.238003	2017-09-21 20:13:13.237514	0
5	10	859e676ed0190211bd422a276a034e769cbbf37c	2017-09-20 20:29:41.424243	2017-09-20 20:29:41.424243	2017-09-21 20:29:41.42355	0
6	11	46c11ea0b779b005db1a58ac14202a644e6639d8	2017-09-20 20:33:23.781749	2017-09-20 20:33:23.781749	2017-09-21 20:33:23.781323	0
7	12	144475a61e8f4d554971cc11bc4a2b312ff969b4	2017-09-20 20:43:09.962903	2017-09-20 20:43:09.962903	2017-09-21 20:43:09.961818	0
8	13	747ff342594942f4c9a5b48f3cd9f7d13b1e0d29	2017-09-20 21:06:12.199054	2017-09-20 21:09:35.137646	2017-09-21 21:06:12.197515	1
9	14	9aa37cb92a5f14fefad761255a0fe04765b9f614	2017-09-21 08:49:02.568687	2017-09-21 08:52:35.48605	2017-09-22 08:49:02.568009	1
\.


--
-- Name: verifies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arjun
--

SELECT pg_catalog.setval('verifies_id_seq', 9, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: arjun
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: auction_items auction_items_pkey; Type: CONSTRAINT; Schema: public; Owner: arjun
--

ALTER TABLE ONLY auction_items
    ADD CONSTRAINT auction_items_pkey PRIMARY KEY (id);


--
-- Name: auctions auctions_pkey; Type: CONSTRAINT; Schema: public; Owner: arjun
--

ALTER TABLE ONLY auctions
    ADD CONSTRAINT auctions_pkey PRIMARY KEY (id);


--
-- Name: bidding_tables bidding_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: arjun
--

ALTER TABLE ONLY bidding_tables
    ADD CONSTRAINT bidding_tables_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: arjun
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: arjun
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: arjun
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: arjun
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: arjun
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: verifies verifies_pkey; Type: CONSTRAINT; Schema: public; Owner: arjun
--

ALTER TABLE ONLY verifies
    ADD CONSTRAINT verifies_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

