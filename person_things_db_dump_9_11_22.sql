--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-1.pgdg22.04+1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-1.pgdg22.04+1)

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
-- Name: club; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.club (
    id integer NOT NULL,
    name character(25) NOT NULL,
    meeting_day integer NOT NULL
);


--
-- Name: club_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.club_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: club_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.club_id_seq OWNED BY public.club.id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.person (
    id integer NOT NULL,
    name character(25) NOT NULL,
    age integer NOT NULL,
    grade integer NOT NULL
);


--
-- Name: person_club; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.person_club (
    person_id integer NOT NULL,
    club_id integer NOT NULL
);


--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- Name: shoe_instance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shoe_instance (
    id integer NOT NULL,
    color character(25) NOT NULL,
    size numeric NOT NULL,
    make character(25) NOT NULL,
    model character(25) NOT NULL,
    person_id integer
);


--
-- Name: shoe_instance_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shoe_instance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shoe_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shoe_instance_id_seq OWNED BY public.shoe_instance.id;


--
-- Name: club id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.club ALTER COLUMN id SET DEFAULT nextval('public.club_id_seq'::regclass);


--
-- Name: person id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- Name: shoe_instance id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shoe_instance ALTER COLUMN id SET DEFAULT nextval('public.shoe_instance_id_seq'::regclass);


--
-- Data for Name: club; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.club (id, name, meeting_day) FROM stdin;
1	Dungeons & Dragons       	6
2	Gaming                   	5
3	Chess                    	4
4	PLTW                     	4
5	knitting                 	1
6	Anime                    	2
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.person (id, name, age, grade) FROM stdin;
1	John                     	16	11
2	Sarah                    	15	10
3	Greg                     	17	12
\.


--
-- Data for Name: person_club; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.person_club (person_id, club_id) FROM stdin;
1	1
1	2
1	3
2	3
2	4
2	5
3	6
\.


--
-- Data for Name: shoe_instance; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.shoe_instance (id, color, size, make, model, person_id) FROM stdin;
1	red                      	8.0	Nike                     	Swish                    	2
2	green                    	8.0	Adidas                   	Classic                  	2
3	green                    	10.5	Vans                     	Skate                    	1
4	orange                   	10.5	Reebok                   	Run                      	1
5	black                    	12.0	Reebok                   	Float                    	3
\.


--
-- Name: club_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.club_id_seq', 6, true);


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.person_id_seq', 3, true);


--
-- Name: shoe_instance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shoe_instance_id_seq', 5, true);


--
-- Name: club club_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.club
    ADD CONSTRAINT club_pkey PRIMARY KEY (id);


--
-- Name: person_club person_club_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person_club
    ADD CONSTRAINT person_club_pkey PRIMARY KEY (person_id, club_id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: shoe_instance shoe_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shoe_instance
    ADD CONSTRAINT shoe_instance_pkey PRIMARY KEY (id);


--
-- Name: person_club person_club_club_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person_club
    ADD CONSTRAINT person_club_club_id_fkey FOREIGN KEY (club_id) REFERENCES public.club(id);


--
-- Name: person_club person_club_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person_club
    ADD CONSTRAINT person_club_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- Name: shoe_instance shoe_instance_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shoe_instance
    ADD CONSTRAINT shoe_instance_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- PostgreSQL database dump complete
--

