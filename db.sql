--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-3)
-- Dumped by pg_dump version 12.4 (Debian 12.4-3)

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

DROP DATABASE demo;
--
-- Name: demo; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE demo WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_AU.UTF-8' LC_CTYPE = 'en_AU.UTF-8';


\connect demo

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
-- Name: dream_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dream_session (
    id text NOT NULL,
    label text NOT NULL,
    expires_at real NOT NULL,
    payload text NOT NULL
);


--
-- Name: people; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.people (
    id integer NOT NULL,
    name text NOT NULL,
    origin text
);


--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.people_id_seq OWNED BY public.people.id;


--
-- Name: people id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people ALTER COLUMN id SET DEFAULT nextval('public.people_id_seq'::regclass);


--
-- Data for Name: dream_session; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.dream_session VALUES ('t34UhktctFo8HOI8YzWIOUb-', 'QqSc3V_Scy4m', 1.6286975e+09, '{}');
INSERT INTO public.dream_session VALUES ('QlcZ3KCTl8dQLrTmYR6L8E8q', 'wIAbnW7j1eyM', 1.6286976e+09, '{}');


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.people VALUES (6, 'sam', NULL);
INSERT INTO public.people VALUES (1, 'ian', 'Australia');
INSERT INTO public.people VALUES (3, 'xavier', 'France');
INSERT INTO public.people VALUES (2, 'bertrand', 'France');
INSERT INTO public.people VALUES (8, 'clément', 'France');
INSERT INTO public.people VALUES (4, 'khadija', 'Morocco');
INSERT INTO public.people VALUES (5, 'graham', 'England');
INSERT INTO public.people VALUES (7, 'hanna', 'Poland');


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.people_id_seq', 8, true);


--
-- Name: dream_session dream_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dream_session
    ADD CONSTRAINT dream_session_pkey PRIMARY KEY (id);


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

