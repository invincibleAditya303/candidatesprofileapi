--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 16.8

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: user_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_info (
    id integer NOT NULL,
    name character varying(50),
    phone character varying(20),
    email character varying(50),
    gender character varying(10),
    experience integer,
    skills character varying(200)
);


ALTER TABLE public.user_info OWNER TO postgres;

--
-- Name: user_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_info_id_seq OWNER TO postgres;

--
-- Name: user_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_info_id_seq OWNED BY public.user_info.id;


--
-- Name: user_info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_info ALTER COLUMN id SET DEFAULT nextval('public.user_info_id_seq'::regclass);


--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_info (id, name, phone, email, gender, experience, skills) FROM stdin;
1	Aditya	9905761423	aditya123@example.com	Male	1	Python
2	Naresh	9905761375	naresh123@example.com	Male	2	JavaScript
3	Vindhu	9905762798	vindhu123@example.com	Male	1	JAVA
4	Shiva	9905768902	shiva123@example.com	Male	1	Python
5	Bharadwaj	9905764986	bharadwaj123@example.com	Male	1	JavaScript
6	Praveen	9949061475	praveen123@example.com	Male	2	SQL
7	Prakash	9949061375	prakash123@example.com	Male	2	Pyhton
8	Suraj	9949062798	suraj123@example.com	Male	2	JAVA
9	Sairam	9949068902	siaram123@example.com	Male	1	Python
10	Ambika	9949064986	ambika23@example.com	Female	1	JavaScript
11	Rushika	9848021423	rushika23@example.com	Female	2	SQL
12	Sirisha	9848021375	sirisha23@example.com	Female	2	JAVA
13	Purnima	9848022798	puenima23@example.com	Female	2	Python
14	Ravi	9848028902	ravi23@example.com	Male	1	JavaScript
15	Pavan	9848024986	pavan23@example.com	Male	1	JAVA
\.


--
-- Name: user_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_info_id_seq', 15, true);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

