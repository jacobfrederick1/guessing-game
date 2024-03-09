--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_game integer NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (52, 'user_1709983542415', 4, 63);
INSERT INTO public.users VALUES (35, 'user_1709982394803', 0, 804);
INSERT INTO public.users VALUES (34, 'user_1709982394804', 0, 13);
INSERT INTO public.users VALUES (37, 'user_1709982493917', 0, 566);
INSERT INTO public.users VALUES (36, 'user_1709982493918', 0, 188);
INSERT INTO public.users VALUES (55, 'user_1709983621011', 1, 377);
INSERT INTO public.users VALUES (39, 'user_1709982546961', 0, 834);
INSERT INTO public.users VALUES (38, 'user_1709982546962', 0, 461);
INSERT INTO public.users VALUES (41, 'user_1709982743857', 0, 930);
INSERT INTO public.users VALUES (40, 'user_1709982743858', 0, 570);
INSERT INTO public.users VALUES (43, 'user_1709982794175', 0, 842);
INSERT INTO public.users VALUES (54, 'user_1709983621012', 4, 938);
INSERT INTO public.users VALUES (42, 'user_1709982794176', 0, 739);
INSERT INTO public.users VALUES (45, 'user_1709983094912', 1, 706);
INSERT INTO public.users VALUES (57, 'user_1709983667514', 1, 46);
INSERT INTO public.users VALUES (44, 'user_1709983094913', 4, 891);
INSERT INTO public.users VALUES (33, 'jacob', 2, 12);
INSERT INTO public.users VALUES (56, 'user_1709983667515', 4, 34);
INSERT INTO public.users VALUES (47, 'user_1709983431643', 1, 729);
INSERT INTO public.users VALUES (59, 'user_1709983681430', 1, 555);
INSERT INTO public.users VALUES (46, 'user_1709983431644', 4, 543);
INSERT INTO public.users VALUES (49, 'user_1709983505396', 1, 50);
INSERT INTO public.users VALUES (58, 'user_1709983681431', 4, 359);
INSERT INTO public.users VALUES (48, 'user_1709983505397', 4, 396);
INSERT INTO public.users VALUES (61, 'user_1709983698425', 1, 125);
INSERT INTO public.users VALUES (51, 'user_1709983507702', 1, 575);
INSERT INTO public.users VALUES (50, 'user_1709983507703', 4, 432);
INSERT INTO public.users VALUES (60, 'user_1709983698426', 4, 871);
INSERT INTO public.users VALUES (53, 'user_1709983542414', 1, 413);
INSERT INTO public.users VALUES (63, 'user_1709983747207', 1, 579);
INSERT INTO public.users VALUES (62, 'user_1709983747208', 4, 685);
INSERT INTO public.users VALUES (65, 'user_1709983892952', 1, 705);
INSERT INTO public.users VALUES (64, 'user_1709983892953', 4, 379);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 65, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

